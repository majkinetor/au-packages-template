$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.48-msspi-0.106/stunnel-5.48-msspi-0.106_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.48-msspi-0.106/stunnel-5.48-msspi-0.106_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '04a3ed06985a82bc49bb850370e7f82daae9dbc76e6b48b6e8fce26d114873d3'
  checksum64             = 'e3855c3056d70cb22b69638f25a89358a2d159308770853e6b1fb63a8250813c'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
