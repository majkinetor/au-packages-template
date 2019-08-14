$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.1.3908.1.exe'
  checksum               = '1b3bec7106b7e60e368ab38661e9e85ab2679df373374c676bc4088d1f9d08c4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
