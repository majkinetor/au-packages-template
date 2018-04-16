$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'http://4c11bfaa17c7.dahuaddns.com:7000/webplugin.exe'
  checksum               = 'b88ca6d5abc01736fe5c4146d57fb3ca33d75d19064e6174b4659484962ec784'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
