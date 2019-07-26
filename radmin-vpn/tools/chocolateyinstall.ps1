$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.1.3907.exe'
  checksum               = '475d0fbff12debfaa57bf3b247c62e812f5f8a457209c2edfa029b273d63b76d'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
