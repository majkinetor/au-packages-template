$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'faa108b05d5c2f4b438577e543adc9dc5d269cd32e044f920e0721b5997b63fc'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
