$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '7669b170dee42db8ee2273775ed7dfb2d173bdba1b849f70d2c7b379290bce13'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
