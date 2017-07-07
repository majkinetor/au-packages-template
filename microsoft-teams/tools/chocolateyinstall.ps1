$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.0.00.17151/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.17151/Teams_windows_x64.exe'
$checksum32 = 'ae518970c5fa328008588c22c564915d7de019076081ce75b88e769022a377f5'
$checksum64 = 'c38312fd04c5ff05f087e68fec9132e5b5dd115f3fed28e6c97485ba10bf0bfc'

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
