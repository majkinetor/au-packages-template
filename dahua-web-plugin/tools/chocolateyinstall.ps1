$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'http://4c11bfaa17c7.dahuaddns.com:7000/webplugin.exe'
  checksum               = '52f5d89af1452ce08f8520193b1c0895fd4694cac9e12162ec042baf54185f39'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
