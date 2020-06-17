$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/d/1/c/d1c74788-0c6b-4d23-896e-67cf849d31ed/SSMS-Setup-ENU.exe'
$fullChecksum = 'ABC37A45E16C099D7D4CFBE9E16C238C007BCB20FF1FE6BF0FFE916AA2084BEA'

# Upgrading is commented out for 18.x until the first upgrade package is made available by Microsoft

# $upgradeUrl = 'https://download.microsoft.com/download/D/D/4/DD495084-ADA7-4827-ADD3-FC566EC05B90/SSMS-Setup-ENU-Upgrade.exe'
# $upgradeChecksum = 'A092B5F4270F19B83874E8ECDEC8EF309B8DBC55462E99EAFA309A75A1D04E09'

$release = '18.5.1'

# Check if 17.0 is installed so we can get upgrade package instead of full package
# $version17 = [version]"14.0.17099.0"
$ssms180 = $false # Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Where-Object { $_.DisplayName -eq "SQL Server Management Studio" -and ([Version]$_.DisplayVersion) -ge $version17 }

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = ''

  silentArgs    = "/quiet /install /norestart /log `"$env:TEMP\chocolatey\$($env:ChocolateyPackageName)\$($env:ChocolateyPackageVersion)\SSMS.MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = "SQL Server Management Studio - $release"
  checksum      = ''
  checksumType  = 'SHA256'
}

if ($ssms180) {
    Write-Warning "Existing install found, using upgrade installer"
    $packageArgs.url = $upgradeUrl
    $packageArgs.checksum = $upgradeChecksum
} else {
    $packageArgs.url = $fullUrl
    $packageargs.checksum = $fullChecksum
}

Install-ChocolateyPackage @packageArgs
