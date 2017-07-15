$ErrorActionPreference = 'Stop';

$packageName = 'unifi-controller'
$softwareName = 'Ubiquiti UniFi*'
$installerType = 'EXE' 

$validExitCodes = @(0, 3010, 1605, 1614, 1641)
if ($installerType -ne 'MSI') {
  $silentArgs = '/S'
  $validExitCodes = @(0)
}

$uninstalled = $false
[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
  $key | % { 
    $file = "$($_.UninstallString)"

    if ($installerType -eq 'MSI') {
      $silentArgs = "$($_.PSChildName) $silentArgs"

      $file = ''
    }

    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File "$file"
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
}

Write-Output "Respond to 'keep settings' dialog prompt"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$ahkScript = "$toolsPath\unifi-uninstall.ahk"
AutoHotkey $ahkScript $packageArgs.fileFullPath

# Win8/2012 supports 'Remove-NetFirewallRule' - https://technet.microsoft.com/en-us/library/jj554908(v=wps.620).aspx
$osVersion = [Environment]::OSVersion.Version

if ($osVersion.Major -gt 6 -or ($osVersion.Major -eq 6 -and $osVersion.Minor -ge 2)) {
    Remove-NetFirewallRule -Name UniFi-Mgmt-In 
    Remove-NetFirewallRule -Name UniFi-Mgmt-Out
    Remove-NetFirewallRule -Name UniFi-DvcInfrm-In
    Remove-NetFirewallRule -Name UniFi-DvcInfrm-Out
    Remove-NetFirewallRule -Name UniFi-Ctrlr-In
    Remove-NetFirewallRule -Name UniFi-Ctrlr-Out
    Remove-NetFirewallRule -Name UniFi-PrtlRdr-In
    Remove-NetFirewallRule -Name UniFi-PrtlRdr-Out
    Remove-NetFirewallRule -Name UniFi-PrtlRdrSsl-In
    Remove-NetFirewallRule -Name UniFi-PrtlRdrSsl-Out
    #Remove-NetFirewallRule -Name UniFi-DB-In
    #Remove-NetFirewallRule -Name UniFi-DB-Out
    Remove-NetFirewallRule -Name UniFi-DvcDisc-In
    Remove-NetFirewallRule -Name UniFi-DvcDisc-Out
}