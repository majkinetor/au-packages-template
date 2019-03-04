$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3723.5.exe'
  checksum               = '631677bafd3a82a5f756563e0aa677a0c001cbf3be70ef80c53015574178efca'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
