$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '82cc54c5abc72aef1dbe8ae58e0cf82ab6d46eeb5a3ffdeae39700ddb60db557'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
