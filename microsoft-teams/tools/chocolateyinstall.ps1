$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.27559/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.27559/Teams_windows_x64.exe'
$checksum32 = '505f61ae810d85d03ee515e1f0de09df5c369dade7f1b53b881b8a238d2ace6f'
$checksum64 = 'b3059e6275be05eb229102722b5cdd276745d0eee521461e37b0065717d48482'

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
