$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/EventGhost/EventGhost/releases/download/v0.5.0-rc4/EventGhost_0.5.0-rc4_Setup.exe'

  softwareName  = 'eventghost*'

  checksum      = '17d41633cb999cb163c83bce1f39ae27866116660dfd026351362c830a330872'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
