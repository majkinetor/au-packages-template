$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.23.0/UEFITool_0.23.0_mac.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0031c25d4f86e8a98a3070c9a8cc199bb8cf10aba7bb182fe6bdeaea5ab27725'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
