$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://reqrypt.org/download/reqrypt-1.3.1-win64-files.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'de78e7d0a837e1bccd56175374ef20ab9637ac2a3cfb5f87c070ede17b816d38'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
