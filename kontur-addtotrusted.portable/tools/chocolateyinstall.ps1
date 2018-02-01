$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted_User.exe'
  checksum               = '25b23284beb3c5795a60cd7afbbbced72215e304520032d482f5bfc2b924545f'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
