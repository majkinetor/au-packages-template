$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://r1ch.net/assets/twitchtest/twitchtest-1.51.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'f74e6855a73173b2fff1eecdf00abefc84db6af1024f66c245329af82b7bae7b'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
