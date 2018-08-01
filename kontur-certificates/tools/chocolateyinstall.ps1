$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'daa7b8f5db8be14ba9b3f14d21cbf0d5e5a9219e4945a70257b233d9e6eb22be'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
