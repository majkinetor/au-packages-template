$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'e64aa7a6d56d58f20e8816ef6b3412d036548bf942597751c93701ab4662e64a'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
