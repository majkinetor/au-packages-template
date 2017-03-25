
$ErrorActionPreference = 'Stop';


$packageName= 'favbinedit'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://ftp.vector.co.jp/68/33/3447/FavBinEdit-1-1-7.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'FavBinEdit*'

  checksum      = 'c32c19ebdf3fd8a8ddfd533c9cb132b09f48dc1d5fa83b0da4519d6e05c5ab7e'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs


















