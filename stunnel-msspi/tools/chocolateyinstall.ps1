$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.50-msspi-0.135/stunnel-5.50-msspi-0.135_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.50-msspi-0.135/stunnel-5.50-msspi-0.135_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '11176616f0f3239b0d556e503784734216201c217edb2e3cbc502ae515bdc406'
  checksum64             = '7285b5a3af6eeeefca41beed4219569f9086be7b4c98aaef3823481eac4850ce'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
