$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.8.1.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '1a70fe16edc6c51c0316c29c97c20efbdc218c77ec5acb70f2fc05f87ef2d431'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
