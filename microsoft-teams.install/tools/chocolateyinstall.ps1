$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.14359/Teams_windows.msi'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.14359/Teams_windows_x64.msi'
$checksum32 = '067c81ee43fcaa1339556d7b6c66a40bdad6bb17349c9287c1e10943304edde5'
$checksum64 = '3a6a00f69c6a0e7b3ee7d268c5bff42c4953f2288d908348a6a7503e744b3cc8'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'Teams Machine-Wide Installer'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
