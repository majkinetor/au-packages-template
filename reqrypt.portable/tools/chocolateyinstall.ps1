$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/basil00/reqrypt/releases/download/v1.4.1/reqrypt-1.4.1-win64-files.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '8c67936d698293411aaca27f5fbd6e5aa81829a25591539c874b209677147e53'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
