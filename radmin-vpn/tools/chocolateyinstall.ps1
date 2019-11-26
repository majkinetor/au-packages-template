$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.1.3969.3.exe'
  checksum               = 'd5c5176905bc67ea93688786989fd98faf23ab63d3e5414034b982814d11d1c4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
