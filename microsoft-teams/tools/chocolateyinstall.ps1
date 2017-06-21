$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32      = 'https://statics.teams.microsoft.com/production-windows/1.0.00.16451/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.16451/Teams_windows_x64.exe'
$checksum32 = '8271db1075367b877e45e0499537bee4896e097b6bba672c64ec1c494384dd17'
$checksum64 = '4e94d7cb55132bd68832fcbf3c7d35827c28ace9844579cdc605fd51c27b3d45'

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
