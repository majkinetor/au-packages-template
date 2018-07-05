$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted.exe'
  checksum               = 'e4424eeba85a15c5577a30db2c3c7dcc5518a12ce2a25c4182ee53e9b410d0cc'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
