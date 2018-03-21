$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/basil00/reqrypt/releases/download/v1.4.0/reqrypt-1.4.0-win64-install.exe'
  checksum               = '792464d0d587a87d3e5399ed290fe6f5b7c3cb6985d9152b3d55e0f6f8a22a77'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
