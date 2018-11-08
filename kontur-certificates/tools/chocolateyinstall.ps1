$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '0834fc67b647f2ced0e56977456067923f0ca97018005a4206a3ee813f1a2bf6'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
