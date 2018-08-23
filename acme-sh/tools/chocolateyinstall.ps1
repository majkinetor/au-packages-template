$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.0.2.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c0b53124dbb1176a271ea56b65d748be47943e29b7e775816c5fa04c4a4820f3'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
