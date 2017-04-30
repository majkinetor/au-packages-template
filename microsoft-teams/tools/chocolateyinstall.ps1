$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.0.00.10951/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.10951/Teams_windows_x64.exe'
$checksum32 = 'af060f2d0d58003c9858328949d1b706d0226512483d9bb6432ab89a41c298d0'
$checksum64 = '88a513d15714500b33438940870e1f3147cdc8deb96af2c4fd97cb6dd57327e3'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url32
  url64bit      = $url64

  softwareName  = 'microsoft-teams*'

  checksum      = $checksum32
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs    = "-s"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
