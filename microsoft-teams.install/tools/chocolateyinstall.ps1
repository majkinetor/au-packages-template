$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.19257/Teams_windows.msi'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.19257/Teams_windows_x64.msi'
$checksum32 = 'a4489f876230911b436f1c0e4081f71c0946e322330ccdde8fa99859c8056753'
$checksum64 = 'e4b068ed8fd5728587b0a2a1fe95d03b4949ddae4a928586fef3fd0ae142e8bf'

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
