$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'http://soft.lissi.ru/docs/Fox_XCA/win/Fox-XCA-Setup.exe'
  checksum               = '6148539894da5c2c525d53c1e8eddcbbc8baac3f4f4ffe7a09c584654d606064'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
