$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/REDNBLACK/J-Kinopoisk2IMDB/files/264826/Kinopoisk2IMDB_1.1.1.exe.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '8c23ef625b2b3398ca36c738e80ac5ae57831dfb5d5f772e470bb80e88ab9fc4'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
