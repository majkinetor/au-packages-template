$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-teams'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://statics.teams.microsoft.com/production-windows/1.0.00.8201/Teams_windows.exe'
$url64      = 'https://statics.teams.microsoft.com/production-windows-x64/1.0.00.8201/Teams_windows_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'microsoft-teams*'

  checksum      = 'A2E274F215343070B88210CC1A0D51344961A832A2E4ABD7E06D170496A23FFF'
  checksumType  = 'sha256'
  checksum64    = 'F2DB1375811399FD721CC86786243B58C8DCA8EFEB104876D55F54E3CD7C2BDD'
  checksumType64= 'sha256'

  silentArgs    = "-s"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs