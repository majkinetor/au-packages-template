$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.25.0/UEFITool_0.25.0_win32.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c92bec82c3d56932e1c7d07c0d13c94b0308d3de26d5ef984eb7549cf546790b'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
