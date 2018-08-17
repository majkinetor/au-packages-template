$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.5.2.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e9edd93079a0cdf2d1dc6d45450a70d322cc2a91caf5cb06447bacd12b16c90f'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
