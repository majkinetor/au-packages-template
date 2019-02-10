$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.26.0/UEFITool_0.26.0_win32.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '6b95b7057d27d50083406c21efd7941eeb9291dc4eeba92f159cdc7dc0d110b3'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
