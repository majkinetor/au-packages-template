$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'f02b1244c155121c38d24a46b3e3ba296210e93feb8648798d96dd39c1eb16df'
  checksum64             = 'f2a041a2ce7cd1ee637ff68b1c41c234d1a03835e9ca77362b7c198e53ee066f'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
