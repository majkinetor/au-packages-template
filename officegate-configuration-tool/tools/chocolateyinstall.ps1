$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://teleofis.ru/php/download.php?f=1038'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '7d9c4fef20941d38113171c00b1ee98eb8a383c20a5aeede77f6578200fc1aaf'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
