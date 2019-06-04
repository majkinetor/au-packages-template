$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3849.7.exe'
  checksum               = '09a42e5e8799d7c7a8812be51faeea14d9e4891b5bffa8ce1e634eba490938fc'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
