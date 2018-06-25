$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.25.1/UEFITool_0.25.1_win32.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '4ee26b66de617c4a5c78c8dd47fd4f1a304318da9940a92587d9bc30c6677414'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
