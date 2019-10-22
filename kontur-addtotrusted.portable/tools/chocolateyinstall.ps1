$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted_User.exe'
  checksum               = '8d950397dca3659cd4b130553cb02cbef0e85dd2d3622a209a13054573cf22c3'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
