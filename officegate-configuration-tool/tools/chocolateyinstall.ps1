$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://teleofis.ru/php/download.php?f=1038'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0cc5aa2c6c7d7b06f3674cbc55453f3fcb4449817311218c25c707e2beb5849e'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
