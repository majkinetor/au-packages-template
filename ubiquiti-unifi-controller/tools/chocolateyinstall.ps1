$ErrorActionPreference = 'Stop';

$packageName= 'unifi-controller'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.ubnt.com/downloads/unifi/5.4.18/UniFi-installer.exe'
$checksum   = 'e7361719fe5b807aec20f666232386db86424f7e459522fb982303427d216caa'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'Ubiquiti UniFi*'
  checksum      = $checksum
  checksumType  = 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0)
}

# Flag whether we're being invoked by AU module
[bool] $runningAU = (Test-Path Function:\au_GetLatest)

if (-not $runningAU) {
    Write-Verbose "Respond to 'upgrade confirmation' dialog prompt (only for upgrades)"
    $ahkScript = "$toolsDir\unifi-upgrade.ahk"

    $ahkProc = Start-Process -FilePath 'AutoHotkey' -ArgumentList $ahkScript -PassThru

    # Win8/2012 supports 'New-NetFirewallRule' - https://technet.microsoft.com/en-us/library/jj554908(v=wps.620).aspx
    $osVersion = [Environment]::OSVersion.Version

    if ($osVersion.Major -gt 6 -or ($osVersion.Major -eq 6 -and $osVersion.Minor -ge 2)) {
        # Configure firewall for UniFi - from https://community.ubnt.com/t5/UniFi-Wireless/UniFi-AP-firewall-settings-for-Windows-Server-2012-R2/td-p/1090855
        New-NetFirewallRule -Name UniFi-Mgmt-In -DisplayName "UniFi-Mgmt (TCP-In 8081)" -Description "Allows incoming UniFi management traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8081 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-Mgmt-Out -DisplayName "UniFi-Mgmt (TCP-Out 8081)" -Description "Allows outgoing UniFi management traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8081 -Direction Outbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-DvcInfrm-In -DisplayName "UniFi-DvcInfrm (TCP-In 8080)" -Description "Allows incoming UniFi device inform traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8080 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-DvcInfrm-Out -DisplayName "UniFi-DvcInfrm (TCP-Out 8080)" -Description "Allows outgoing UniFi device inform traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8080 -Direction Outbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-Ctrlr-In -DisplayName "UniFi-Ctrlr (TCP-In 8443)" -Description "Allows incoming UniFi Controller traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8443 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-Ctrlr-Out -DisplayName "UniFi-Ctrlr (TCP-Out 8443)" -Description "Allows outgoing UniFi Controller traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8443 -Direction Outbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-PrtlRdr-In -DisplayName "UniFi-PrtlRdr (TCP-In 8880)" -Description "Allows incoming UniFi portal redirect traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8880 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-PrtlRdr-Out -DisplayName "UniFi-PrtlRdr (TCP-Out 8880)" -Description "Allows outgoing UniFi portal redirect traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8880 -Direction Outbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-PrtlRdrSsl-In -DisplayName "UniFi-PrtlRdrSsl (TCP-In 8843)" -Description "Allows incoming UniFi portal redirect for SSL traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8843 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-PrtlRdrSsl-Out -DisplayName "UniFi-PrtlRdrSsl (TCP-Out 8843)" -Description "Allows outgoing UniFi portal redirect for SSL traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 8843 -Direction Outbound -ErrorAction SilentlyContinue
        #New-NetFirewallRule -Name UniFi-DB-In -DisplayName "UniFi-DB (TCP-In 27117)" -Description "Allows incoming UniFi DB traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 27117 -Direction Inbound -ErrorAction SilentlyContinue
        #New-NetFirewallRule -Name UniFi-DB-Out -DisplayName "UniFi-DB (TCP-Out 27117)" -Description "Allows outgoing UniFi DB traffic" -Group UniFi -Enabled True -Protocol TCP -LocalPort 27117 -Direction Outbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-DvcDisc-In -DisplayName "UniFi-DvcDisc (UDP-In 10001)" -Description "Allows incoming UniFi device discovery traffic" -Group UniFi -Enabled True -Protocol UDP -LocalPort 10001 -Direction Inbound -ErrorAction SilentlyContinue
        New-NetFirewallRule -Name UniFi-DvcDisc-Out -DisplayName "UniFi-DvcDisc (UDP-Out 10001)" -Description "Allows outgoing UniFi device discovery traffic" -Group UniFi -Enabled True -Protocol UDP -LocalPort 10001 -Direction Outbound -ErrorAction SilentlyContinue
    }
}

Install-ChocolateyPackage @packageArgs

if (-not $runningAU) {
    $ahkProc.Refresh()

    if (-not $ahkProc.HasExited) { 
        Write-Verbose "No upgrade prompt, so killing autohotkey process"
        $ahkProc.Kill()
    }
}
