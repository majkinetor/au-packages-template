$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/v1.49/etwpackage1.49.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2dd37ca3be8d3566a95ba78a3cbcc3190397d4743f87d74f952e11c40e92708d'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
