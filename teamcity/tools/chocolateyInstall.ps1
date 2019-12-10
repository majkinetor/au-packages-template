$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$filename = "TeamCity-$($env:ChocolateyPackageVersion).tar.gz"
$checksum = '5083304d567c63ec356e5a45317b9d95c3240e6986a23b03fe8492bba4f3414d'

$url = "https://download.jetbrains.com/teamcity/TeamCity-$($env:ChocolateyPackageVersion).tar.gz"
$packagePath = $(Split-Path -parent $toolsDir)
$installPath = Join-Path $packagePath $filename

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $installPath
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
