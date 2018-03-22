$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '6de015a9817f7fb6aab00e570ef8bb7c53247279739bce0d833f9e15e5276c57'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
