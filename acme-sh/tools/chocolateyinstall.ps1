$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.8.2.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ce7d96975edd0f6d0a8e1cf0afbfdc5141c21cfddf7fd7f7a18dd40570adca7e'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
