$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.14359/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.14359/Teams_windows_x64.exe'
$checksum32 = '44e249731dab4471811b3642a0e365c09d6f8bba119c261f6b9b72d3d6a017ef'
$checksum64 = '20176e16b985d4860de96d7e9e2748d4aeb289f6ec6911ece5992a69252b1b45'

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
