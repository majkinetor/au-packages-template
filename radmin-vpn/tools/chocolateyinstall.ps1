$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3722.4.exe'
  checksum               = 'c82b4a4416f2f4006b4a504ca5865c8eb99a07d3a0790b53c8601b7d33202ac9'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
