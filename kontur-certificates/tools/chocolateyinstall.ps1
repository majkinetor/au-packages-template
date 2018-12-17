$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '89a1ea9ee9f2d6b349033cc674cc2b90c854c91b0ff08e042cc19c350799ef9c'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
