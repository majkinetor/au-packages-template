$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/8/8/3/883FD1FA-FE61-4E83-85F9-FA46D4A5B866/SSMS-Setup-ENU.exe'
$fullChecksum = '770675775E650BC4B16D26895C5FEE10D1BAF07526762DA46ED0F031CAC418C6'

$upgradeUrl = 'https://download.microsoft.com/download/8/8/3/883FD1FA-FE61-4E83-85F9-FA46D4A5B866/SSMS-Setup-ENU-Upgrade.exe'
$upgradeChecksum = 'D0DBDC0FC4413854C7040FC3E18CDA3A0E09C4E496F46075215A3C9C5684B33E'

$release = '17.5'

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
