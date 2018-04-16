$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'http://192.168.1.108/webplugin.exe'
  checksum               = 'd8e02703d7a5179fcd096b55428b155afa492cdc9fe67d434812245ad9b4736d'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
