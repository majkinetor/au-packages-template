$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '7ad558b2afea91b67f9a3d5b757829d80e1ec3e4ed9781d3e646141160f8d878'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
