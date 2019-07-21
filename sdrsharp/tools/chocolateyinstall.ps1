$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0a56a4e9276420582c2f92f91bad97562d5fc5d16b0f4766c6df2fca8bfa3b2d'
  checksum64             = 'ed01092ae4f652f0508e60964138a0fff435be004b9424179c85c1fb2626a27e'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
