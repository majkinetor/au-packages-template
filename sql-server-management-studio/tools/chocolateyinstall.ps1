$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/B/8/3/B839AD7D-DDC7-4212-9643-28E148251DC1/SSMS-Setup-ENU.exe'
$fullChecksum = 'F094C6C2CBD848232A660C6C723F6B9962D15A8D3D8AF3812F6DE2A5CDBFB777'

$upgradeUrl = 'https://download.microsoft.com/download/B/8/3/B839AD7D-DDC7-4212-9643-28E148251DC1/SSMS-Setup-ENU-Upgrade.exe'
$upgradeChecksum = '3F448400BB6C62B6458C0B1AFF154067358CDA3FA1684D3F376E74EEF8492422'

$release = '17.9'

# Check if 17.0 is installed so we can get upgrade package instead of full package
$version17 = [version]"14.0.17099.0"
$ssms170 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Where-Object { $_.DisplayName -eq "SQL Server Management Studio" -and ([Version]$_.DisplayVersion) -ge $version17 }

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = ''

  silentArgs    = "/quiet /install /norestart /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = "SQL Server Management Studio - $release"
  checksum      = ''
  checksumType  = 'SHA256'
}

if ($ssms170) {
    Write-Warning "Existing install found, using upgrade installer"
    $packageArgs.url = $upgradeUrl
    $packageArgs.checksum = $upgradeChecksum
} else {
    $packageArgs.url = $fullUrl
    $packageargs.checksum = $fullChecksum
}

Install-ChocolateyPackage @packageArgs
