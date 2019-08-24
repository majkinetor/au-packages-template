$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://r1ch.net/assets/twitchtest/twitchtest-1.52.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '36ef44b83e0a5bd627d32f753f70de1c73a5c9c320d14ef7ce4ae6aebc8fbef4'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
