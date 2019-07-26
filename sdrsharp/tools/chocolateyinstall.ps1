$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2cff866f85f0fb772171e45ba0ee577ccf387a7f18f51b1f354e67951f630499'
  checksum64             = '380a62ef8eddcd5512150526345877ec921e8c8a64c0120e29bc60bf48adc0da'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
