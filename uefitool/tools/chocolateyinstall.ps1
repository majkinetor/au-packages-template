$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.24.0/UEFITool_0.24.0_win32.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'deb2b21dcc72118e61647a87e24719949409e685786508e4ed4e59019bc560ee'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
