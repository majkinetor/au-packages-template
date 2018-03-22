$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '26896803cb8f60952cf7422f4a3f9ea43b7d703429c7edabee68c0357be90aff'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
