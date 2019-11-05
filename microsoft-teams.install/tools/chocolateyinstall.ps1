$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.27559/Teams_windows.msi'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.27559/Teams_windows_x64.msi'
$checksum32 = 'e3df123a92eeb01f7f404e6348c4a1fba61694349a2bb060d246cb1789d24e1a'
$checksum64 = '9a44d99690014fdd36cae68f72afc596a6428b214117f74329789713edd90bea'

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
