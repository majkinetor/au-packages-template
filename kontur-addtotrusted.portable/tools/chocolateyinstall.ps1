$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted_User.exe'
  checksum               = '225f39b7848a56cac44d66c3e2684f85f072953f82ef121cd8d525cccf88946e'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
