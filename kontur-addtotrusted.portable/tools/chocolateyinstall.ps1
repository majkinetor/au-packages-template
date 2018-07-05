$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted_User.exe'
  checksum               = '6689716e059cb665dadd64db59a1567dae7c0285680c742414fc7df36076c30a'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
