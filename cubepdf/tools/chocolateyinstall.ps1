
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

  checksum      = 'dd82529027cf2f356eff07dc043e2c951fb310304eb46e02816053999e2e4563'
  checksumType  = 'sha256'
  checksum64    = '649f8c0bd0f220b0963e92fc103941b1f8a9f39fa1e647200c3c45975a84ad04'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs


















