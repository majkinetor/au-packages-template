
$ErrorActionPreference = 'Stop';

$packageName= 'cubepdf'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.cube-soft.jp/cubepdfutility/dl.php?mode=x86'
$url64      = 'http://www.cube-soft.jp/cubepdfutility/dl.php?mode=x64'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'cubepdf*'

  checksum      = 'a167852870fd2b6d7a4a65c67db8bfa5784bc265c616b63cd1f263a4acf0049b'
  checksumType  = 'sha256'
  checksum64    = '15872259648e1577cd25994d1c39550ee08671b473cf537349424073c7c8ce34'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs


















