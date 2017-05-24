$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.0.00.13751/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.13751/Teams_windows_x64.exe'
$checksum32 = 'd1e8a2562a1839bbb36fa0ef469ab1b5d162d89d7a09e70adf876d0d93539267'
$checksum64 = '8ef3f47d6c137df153e04ceb0eec6d2e9bbe9d09c7df8b4827b830a0e06c917c'

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
