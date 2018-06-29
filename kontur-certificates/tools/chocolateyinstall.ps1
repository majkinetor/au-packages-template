$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'a9c99ea1e42f05d0ffc3229f35f880391277d08c072a36f4fd0640bf9f60a9bf'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
