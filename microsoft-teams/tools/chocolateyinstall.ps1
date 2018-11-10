$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.29068/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.29068/Teams_windows_x64.exe'
$checksum32 = 'bd72e0ae66dca3313cb37456635018e481fb3d5a041931fcc3ea96d944ef95ac'
$checksum64 = 'd421dc6e4cd21564887e2f045944b69ba73d062d7b78ac09a482942ba2e1c229'

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
