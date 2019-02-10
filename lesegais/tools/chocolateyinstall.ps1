$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://lesegais.ru/upload/EGAISCryptoSetup.exe'
  checksum               = '96b3843571b8bf669852734656f262bc346c1b9c85e02735dbaa244e03d5306b'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
