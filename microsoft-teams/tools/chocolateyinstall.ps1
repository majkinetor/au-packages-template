$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.0.00.23451/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.23451/Teams_windows_x64.exe'
$checksum32 = 'a7f1ad256287e6320fe43886dfcff1f00ca878185dff18fab5957d387e8901b1'
$checksum64 = '04604a459237ef438792b28dc4847032a9111b4c73f22a9aa9d01e324dd4bab6'

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
