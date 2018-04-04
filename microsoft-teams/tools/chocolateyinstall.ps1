$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.7855/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.7855/Teams_windows_x64.exe'
$checksum32 = 'd9bb0945b06e42f91718faefc0a41e03c72c6f8d628632aa19b300f1de3e0b11'
$checksum64 = '4244ee29b1e1522bbec55cecece6488a236337a47e1e4157a35bee2886c6df29'

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
