$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/A/F/5/AF52C08E-AF5C-41F0-8E50-2E4DE2A3A33A/SSMS-Setup-ENU.exe'
$fullChecksum = '1319B27BC6EFA8612A05BE7B9FDF63BE17F981DDE375AF2A2F8BD87064543CFD'

$upgradeUrl = 'https://download.microsoft.com/download/A/F/5/AF52C08E-AF5C-41F0-8E50-2E4DE2A3A33A/SSMS-Setup-ENU-Upgrade.exe'
$upgradeChecksum = '8E031645FCCF33ACEF1A7B2618534D47BEB14A4FB4BF77447B61EB3508A26A3B'

$release = '17.6'

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
