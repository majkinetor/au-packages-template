$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.55-msspi-0.144/stunnel-5.55-msspi-0.144_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.55-msspi-0.144/stunnel-5.55-msspi-0.144_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '1151eb9ee84c593eb3202d2b4ccc8bebc98a5881a376ce6e62d9c68de4b59966'
  checksum64             = '3d1bbb2c84cba2c6b2f2f40ebd737434c3b4d810dd68dd5570289cb36fc82689'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
