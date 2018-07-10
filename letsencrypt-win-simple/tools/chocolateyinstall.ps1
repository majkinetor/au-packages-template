$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v1.9.8.4/letsencrypt-win-simple.v1.9.8.4.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '6b5d3899df25b6a7b6b439bbb10c5ce05f77108e443b3bea8286d37721a82c56'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
