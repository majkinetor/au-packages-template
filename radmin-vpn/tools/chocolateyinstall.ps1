$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3721.3.exe'
  checksum               = '96b2596643b13e7845972277a20ddb5d6bc40e0626b6b895f6f32a9d1d1a4064'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
