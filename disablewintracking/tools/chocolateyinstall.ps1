$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/10se1ucgo/DisableWinTracking/releases/download/3.2.2/dwt-3.2.2-cp27-win_x86.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9fccf3796aa791ce02bfdf221f716af38e9984aef15dd6acaca2267a25a3ba2d'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
