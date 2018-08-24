$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ea823fd45af3bb8c34923a7e6dbb31a7909c6ed5902f7f09d2e4a14a6e66757d'
  checksum64             = '3ad7a06e48dd99dde5371774c8ac88a2eaa84ce17c2d7ee4b49ff7127b5dbbbd'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
