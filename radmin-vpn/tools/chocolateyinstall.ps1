$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3524.2.exe'
  checksum               = 'd9da7751058c2ea776e7364a3a1269d129cdf8e9d1b9d39a5c9f372a150c6139'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
