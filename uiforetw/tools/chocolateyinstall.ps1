$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/v1.51/etwpackage1.51.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2cf7b3d008daafa1191db4b9bb49e6ce8b1c7a968badd1d8e9a64349d9b0b8fc'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
