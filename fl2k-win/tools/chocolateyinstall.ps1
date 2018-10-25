$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/winterrace/fl2k_win/releases/download/v0.1/fl2k_win_2018-08-09.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '1b0ba6715227e0bd4ff3e3817da44e1e6495f343f20e488d29177be66d0f1252'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
