$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum = '54D77B603791BC473B4795A490913BEE5C84D8704D3C5190797350FE62B01D61'
$url = 'https://download.red-gate.com/installers/DotNETDeveloperBundle/2019-10-24/DotNETDeveloperBundle.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  silentArgs    = "/IAgreeToTheEULA"
  validExitCodes= @(0)
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
