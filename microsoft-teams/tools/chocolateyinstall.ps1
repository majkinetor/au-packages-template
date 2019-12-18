$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.2.00.34161/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.2.00.34161/Teams_windows_x64.exe'
$checksum32 = '716ff8a58757769c5cac2c26418231976303bac985083f74d943d707b94a1353'
$checksum64 = '6a05093cf30760f5f1480f058364da0490874e320e0a531688d7d627b86b6326'

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
