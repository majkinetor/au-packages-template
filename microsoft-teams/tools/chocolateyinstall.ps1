$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.cdn.office.net/production-windows/1.3.00.13565/Teams_windows.exe'
$url64      = 'https://statics.teams.cdn.office.net/production-windows-x64/1.3.00.13565/Teams_windows_x64.exe'
$checksum32 = '60b0b5fe34cbc1b745e8bb9d75eb26b13c2d27259cc4b4e77bf7b01a6cd276af'
$checksum64 = 'ac8f18a6311375f33748c435ddd77051d7a5f207fd0832415fe2684375e317a5'

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
