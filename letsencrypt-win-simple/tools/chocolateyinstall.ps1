$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v1.9.12.2/win-acme.v1.9.12.2.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0e44e325af91cfbc1c1dc9222f47a01aea55a95fc6214f4f82560b715d2c82b1'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
