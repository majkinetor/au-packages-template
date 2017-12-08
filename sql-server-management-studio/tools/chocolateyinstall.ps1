$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/0/A/E/0AE3B5C9-0D22-4EF3-B48A-73181A7F8EF7/SSMS-Setup-ENU.exe'
$fullChecksum = 'CD174C1C01FCDE5A992A6ACB12A5B21B44F88D595EFE646644E9A4797C52F1C4'

$upgradeUrl = 'https://download.microsoft.com/download/0/A/E/0AE3B5C9-0D22-4EF3-B48A-73181A7F8EF7/SSMS-Setup-ENU-Upgrade.exe'
$upgradeChecksum = 'DEE22963243345EBE96D10019C32D9EF2D31A40FDF2EDBC929ECD2B02E99FD8F'

$release = '17.4'

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
