$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'c6a30b343e97e5121bbca86d6575ee48a3f869e2104479240829a57f7847ca3c'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
