$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.52-msspi-0.137/stunnel-5.52-msspi-0.137_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.52-msspi-0.137/stunnel-5.52-msspi-0.137_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'cb2e0218c951949f2cf443fe2684dd7eb0a93a4251d9120dcc9c609bbfc62aba'
  checksum64             = '8628e7e796f1162c2c5f6385f3cb1313323fd947da86852049d0043559e34b3c'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
