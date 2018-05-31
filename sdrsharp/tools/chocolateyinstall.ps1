$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '175d5405f9f0317b9bb19b334d80d287b75b81dff1e9b25ebd2d0ee319bcf9c6'
  checksum64             = 'f5d9849243eef26e79d0034c8890ab2e4fb890ef2987039a05886957d61c5a3f'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
