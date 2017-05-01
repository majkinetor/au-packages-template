$ErrorActionPreference = 'Stop';
$packageName= 'smartsystemmenu'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com//AlexanderPro/SmartSystemMenu/releases/download/v1.0.5336.20780/SmartSystemMenu_v1.0.5336.20780.zip'

$packageArgs = @{
  packageName   = $packageName
  destination   = $toolsDir
  fileType      = 'zip'
  url           = $url
  softwareName  = 'SmartSystemMenu*'
  checksum      = '68a0f1b309ba7903dd0cd663dc391881b61bc63d02296621a0e930b7a695130b'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs









