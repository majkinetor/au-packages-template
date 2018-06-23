$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.1.00.16255/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.1.00.16255/Teams_windows_x64.exe'
$checksum32 = '812f457a26d2c5525b8e342d117c925dd7e5b87f03d71f1b12e7bd5525c53727'
$checksum64 = '7abc6a877dc79a7a8d62bbc69a3eb0f055365af50a2d9681a85ec9fea78f534c'

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
