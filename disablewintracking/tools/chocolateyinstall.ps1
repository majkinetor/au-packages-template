$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/10se1ucgo/DisableWinTracking/releases/download/v3.2.1/dwt-3.2.1-cp27-win_x86.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'd4c31d005c1a676e9867f4a2a553299e55aa0857626d25a1d7dd84b00e505757'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
