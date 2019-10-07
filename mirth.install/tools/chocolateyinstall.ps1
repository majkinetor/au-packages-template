$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.8.0.b2464/mirthconnect-3.8.0.b2464-windows.exe' # download url, HTTPS preferred
$url64      = 'https://s3.amazonaws.com/downloads.mirthcorp.com/connect/3.8.0.b2464/mirthconnect-3.8.0.b2464-windows-x64.exe' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Mirth Connect *'

  checksum      = '8dc81c4d4b77241a8a0a5bd04f16cd53b006e0839089a61f22fe50776a67b149'
  checksumType  = 'sha256'
  checksum64    = 'dc6e7470b4844e3c41d1495abd50ca8a5de8db02843c47e5418753488f3aa955'
  checksumType64= 'sha256'

  # OTHERS
  silentArgs   = "-q -console -varfile $($toolsDir)\response.varfile"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
