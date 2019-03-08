$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.50-msspi-0.136/stunnel-5.50-msspi-0.136_windows-386.zip'
  url64bit               = 'https://github.com/deemru/stunnel/releases/download/stunnel-5.50-msspi-0.136/stunnel-5.50-msspi-0.136_windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'd09eef51443d563bb2657b12697481fd215b92c375f5a75cf45d7ff278974720'
  checksum64             = '69c453e2845dabb801f63780a0592f80f3a7621d46fc879b168e80fe88cc3357'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
