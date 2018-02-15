$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/LongSoft/UEFITool/releases/download/0.22.1/UEFITool_0.22.1.win.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bec74152099a2974d058ce014f03bcbdcb61caa64975021d2af0bb248b7902f8'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
