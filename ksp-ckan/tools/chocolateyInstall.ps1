$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.25.4/ckan.exe'

  softwareName  = 'eventghost*'

  checksum      = 'e992982615c6afcfe5f52d9872df22f4a2fadb3bf97c37931393ea767e7c3ffc'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
