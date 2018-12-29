$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'f665ac50fa408d0e037f6bb7c931581e50dca5222cca74af5ae5578fee8e5bff'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
