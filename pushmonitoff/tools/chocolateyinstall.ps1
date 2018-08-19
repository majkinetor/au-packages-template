$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.dcmembers.com/skrommel/download/pushmonitoff/?wpdmdl=361'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e73b80e8d32f14e31fc0c90f9e638807f4beae8a330db881537ff6ed9e4a2154'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
