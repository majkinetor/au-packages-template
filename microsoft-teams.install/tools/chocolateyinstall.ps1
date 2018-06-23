$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.16255/Teams_windows.msi'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.16255/Teams_windows_x64.msi'
$checksum32 = '8c2048ced6bbf35ea4afe123b60560eda1fcf0dea795f80bef4e8ed4531a75ff'
$checksum64 = '239f65905b515710af8bb4f666b41e00e7d8d367ebded4902c859fa913b55e4f'

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
