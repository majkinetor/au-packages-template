$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.9.0.b2526/mirthconnect-3.9.0.b2526-windows.exe'
$url64      = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.9.0.b2526/mirthconnect-3.9.0.b2526-windows-x64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Mirth Connect *'

  checksum      = '6e62ba2df73eeb7416fc8d18f9945697b8064661d3506e41c83d5e1ed79f5fe0'
  checksumType  = 'sha256'
  checksum64    = '9845791f4f4437c2f0e77486716f920fb81ec9f9f6d893d88007437e578fb017'
  checksumType64= 'sha256'

  # OTHERS
  silentArgs   = "-q -console -varfile $($toolsDir)\response.varfile"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
