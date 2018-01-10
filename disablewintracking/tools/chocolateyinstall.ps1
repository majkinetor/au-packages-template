$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/10se1ucgo/DisableWinTracking/releases/download/v3.0.1/dwt-3.0.1-cp27-win_x86.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'd4c00704e0888c2b630b9fc61ca93ca222ad30767c6f998f219e96075a12ebfe'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
