$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/EventGhost/EventGhost/releases/download/v0.5.0-rc6/EventGhost_0.5.0-rc6_Setup.exe'

  softwareName  = 'eventghost*'

  checksum      = '5f47157b1af5b6ffbb3927ec3c2aa06181d945d6be09b1641e4e85036d840868'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
