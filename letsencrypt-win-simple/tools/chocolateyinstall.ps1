$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v1.9.12.1/win-acme.v1.9.12.1.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9ffc0f92c9c3391aeda90bc686cb3762794021b37f146337b111fcdd27319d84'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
