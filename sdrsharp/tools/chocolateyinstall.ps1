$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bdc9898bf2d6c21a8b27999937a9103b09269e5cb0686e6619d0c3cd58e8d6cc'
  checksum64             = '48387fc16d1c0089a67ac5bcdb74e110ad89d43ae8ed4c2d735c71d5f0fad6fb'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
