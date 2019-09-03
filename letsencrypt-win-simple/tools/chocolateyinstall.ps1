$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v2.0.10/win-acme.v2.0.10.444.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '516b4a4c800ae95478da5118ade5b99569dda596b23ddbc3174fea2459d7a516'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
