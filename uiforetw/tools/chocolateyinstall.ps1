$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/v1.16/etwpackage.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c8fee2d34517b792e7eb09b4c136c97e339f5f8451824b3b0c61c6508eb57f34'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
