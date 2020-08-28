$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.8.7.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'dce9f6dcd8f5d00b80ab9abce17131fd642f868b09d471519d3f21f3b3323c3a'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
