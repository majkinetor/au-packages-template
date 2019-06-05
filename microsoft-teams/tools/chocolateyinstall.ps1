$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.13765/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.13765/Teams_windows_x64.exe'
$checksum32 = 'fdb007c84f47b6485e4c9c00fe8610104733c653e0254cedcc315554dec47a44'
$checksum64 = '083287e15c2b26a1dc50fb8fc0ec9cb4388fde2b6eb90cb76433d8c31ef980cf'

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
