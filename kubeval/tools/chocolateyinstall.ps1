
$ErrorActionPreference = 'Stop'

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = ''
$url64      = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = '' 
  checksumType64= 'sha512'
}

Install-ChocolateyZipPackage @packageArgs
