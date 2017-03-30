$ErrorActionPreference = 'Stop';
$packageName= 'smartsystemmenu'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  destination   = $toolsDir
  fileType      = 'zip'
  fileFullPath  = Join-Path $toolsDir SmartSystemMenu.zip
  softwareName  = 'SmartSystemMenu*'
  checksum      = '68A0F1B309BA7903DD0CD663DC391881B61BC63D02296621A0E930B7A695130B'
  checksumType  = 'sha256'
}
Get-ChocolateyUnzip @packageArgs










