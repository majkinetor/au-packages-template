$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.34/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.34/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '456fcae619224bc98ee17298899ef8db95bd34c125f9400bbfc10a91744af249'
  checksum64             = '8d1eecc23162627ade4207c20f359ff8ea1f90661aeae4be88d571151491819f'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
