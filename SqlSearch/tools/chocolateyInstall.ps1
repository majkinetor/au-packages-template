$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$checksum = 'DC5D8C128E7B2C57A26E69D16E0FBD84B94296A5FDA1B9DDBD0A7C7C1C2D1B6E'
$url = 'https://download.red-gate.com/installers/SQL_Search/2019-11-25/SQL_Search.exe'

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
