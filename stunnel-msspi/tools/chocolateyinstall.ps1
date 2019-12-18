$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.56-msspi-0.155/stunnel-5.56-msspi-0.155_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.56-msspi-0.155/stunnel-5.56-msspi-0.155_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e59d5c272e7401814dd8dc25645bfb89291dcfce441c75b2cebd985216b1377c'
  checksum64             = '770cda5a22b1939b5f58ff81bfaacd2871151165e4ad59956b03bdd9e767495f'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
