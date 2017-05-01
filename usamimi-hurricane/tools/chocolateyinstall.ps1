$ErrorActionPreference = 'Stop';

$packageName= 'usamimi-hurricane'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://ftp.vector.co.jp/68/23/2117/UsaMimi_v025.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = 'UsaMimi Hurricane*'
  checksum      = '6173cab12459de54a3ec2b508e3f388631e3f145d3e5be2a540741fafdba496e'
  checksumType  = 'sha256'

}

Install-ChocolateyZipPackage @packageArgs
