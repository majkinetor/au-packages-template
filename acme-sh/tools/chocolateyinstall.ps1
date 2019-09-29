$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.8.3.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '471bd2e1d02fc968d8f5deb6f9c9704a5b3325247f0ae8f6933cf90a339e7825'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
