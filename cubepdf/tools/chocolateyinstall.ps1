
$ErrorActionPreference = 'Stop';

$packageName= 'cubepdf'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.cube-soft.jp/cubepdf/dl.php?mode=x86'
$url64      = 'http://www.cube-soft.jp/cubepdf/dl.php?mode=x64'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cubepdf*'

  checksum      = '787521810374841fb0eca4f33d207a31d73ada60e874610116f8cd55b1813b1d'
  checksumType  = 'sha256'
  checksum64    = '5ee23b17bedc27cf339bea2805a181aba0d001a800a7b4a8b4f48cf9c681d1be'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs


















