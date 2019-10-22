$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted.exe'
  checksum               = '4db4253b453151e1a9da959deff2c77f847e5a25aa401df574525b0f6a6c1880'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
