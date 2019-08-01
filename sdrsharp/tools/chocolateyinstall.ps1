$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2a3ba48dfbaa2fd4d24d09595d1e546f8e036a4f46bd8a52cbc00bc066af9c2e'
  checksum64             = 'd7d2077bc8eeb452d3500baca110aee0110f22ea017dc4e083a295d6ecdd6338'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
