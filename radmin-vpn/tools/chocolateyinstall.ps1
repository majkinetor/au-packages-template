$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.radmin-vpn.com/download/Radmin_VPN_1.0.3848.6.exe'
  checksum               = 'e5f448ac0b6c0ba09d25a0481be777221789467bd1e4d6466f021ce365b4cf01'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
