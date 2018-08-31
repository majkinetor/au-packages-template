$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = '3eb4ea076442cc9adec86fb05b2452291744a7ab48b1bfbcacfee1420e1d1c43'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
