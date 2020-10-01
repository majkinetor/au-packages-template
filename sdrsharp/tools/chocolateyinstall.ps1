$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2a2f4fd58ec32ac4a524b934cd7552beb7b7f60adf78cbf534c27ccd29caebe1'
  checksum64             = '378bf5bccae33491f29155aa67968df98cfbeb022bdc106a600a71429eedb03e'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
