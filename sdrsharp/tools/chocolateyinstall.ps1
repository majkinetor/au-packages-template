$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '65eabd506367d22fee1c9862b6561c07824180dc73e16fcffba8ea278348b43f'
  checksum64             = '2ece30338e3516b99bc900db9205a685315aee51db34665bbf4e8098f15f9428'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
