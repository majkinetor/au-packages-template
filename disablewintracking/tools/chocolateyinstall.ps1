$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/10se1ucgo/DisableWinTracking/releases/download/3.2.3/dwt-3.2.3-cp27-win_x86.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '42c6b0d0c6c7c9ae9601cacaea54f96c2ffd4b39e2a5389ebda64d1041d016b8'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
