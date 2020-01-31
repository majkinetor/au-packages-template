$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.3.00.362/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.3.00.362/Teams_windows_x64.exe'
$checksum32 = 'e1a5ebcede4c7056ef1b97e5d64c29c748df9394265dd9e6e6a7cab7012583e5'
$checksum64 = 'b78deabc2d54a05bd523b56a87b667c6802f36a9367a2d6e4e0dafbb88a68ce0'

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
