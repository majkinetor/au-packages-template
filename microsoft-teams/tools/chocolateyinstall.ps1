$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.4664/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.4664/Teams_windows_x64.exe'
$checksum32 = 'd07ed29fd483fa79260f5a15b592125b1f57d4dd5db9f50d3dd2ef9367cb3ee5'
$checksum64 = '1662bec2a50e65b600e5822451fb0ed6820ed2dd1672371a9c5d15d2e3038ac7'

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
