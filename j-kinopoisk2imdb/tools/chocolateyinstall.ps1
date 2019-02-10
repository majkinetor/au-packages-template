$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/REDNBLACK/J-Kinopoisk2IMDB/files/1990807/Kinopoisk2IMDB_1.2.exe.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2959ab5868333d1aaffb7413e205aeabed6cff7715e62e252447d6add1f12491'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
