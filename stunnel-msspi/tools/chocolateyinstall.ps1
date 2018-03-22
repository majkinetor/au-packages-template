$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.44-msspi-0.99/stunnel-5.44-msspi-0.99_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.44-msspi-0.99/stunnel-5.44-msspi-0.99_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '007a9819bbb52596e4b046f20647d9cd91f9f1444ff8ff81589b2cd25126842d'
  checksum64             = '98b933d3875d4e7993c5b422e3e815722b2c1d1e82786540ba336abf92568e1e'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
