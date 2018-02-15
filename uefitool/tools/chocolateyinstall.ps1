$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.22.3/UEFITool_0.22.3_win.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bf962fb0bd9cb733d15ed334be3b17cac81f10063205bb6cf88ff32f3429a80c'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
