$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = 'd05b7cc6f9ce0ec78ddb62b9f7a34a9e49e2ddd36b4e641c65deca2414f8856f'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
