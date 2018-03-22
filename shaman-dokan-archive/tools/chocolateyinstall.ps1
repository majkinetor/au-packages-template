$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/antiufo/Shaman.Dokan.Archive/releases/download/1.0/Shaman.Dokan.Archive.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'b3dc6d746c61af0ca404c3d7b238946b3b6c4d4c3b5460bd2434c92fa8949af7'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
