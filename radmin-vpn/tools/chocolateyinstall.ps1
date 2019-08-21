$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.1.3909.2.exe'
  checksum               = 'b59c331b89e7187d9f965caf8c662dc30fc94f5a2a4ef8707f502efad55a1885'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
