$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ce6f292971930e154fae04084f2ae1d59feed10fe462fddd1ad37a562ed7eca7'
  checksum64             = '626bc02ebb02e30a9f46a1873bb8203b476ed2eddaa3c2e0e317e311ac85e458'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
