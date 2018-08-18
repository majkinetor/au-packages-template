$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.3.0.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'dd575970beacdbc2e050b27be8b8b58fdf1eab62d5c0b2b89b19ed3ede98c31e'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
