$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.49-msspi-0.133/stunnel-5.49-msspi-0.133_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.49-msspi-0.133/stunnel-5.49-msspi-0.133_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e03a50133939f97e90422de770f1c7f9b9a01d8a608ac755987fe08b25661f71'
  checksum64             = '992a237245ebbb64cbc264cabfd4554267823d7088cf76cd726cabb69e1bcea8'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
