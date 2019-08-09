$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v2.0.9/win-acme.v2.0.9.386.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '14905b432aa324f301632e8715f9f7cb6d28f4cfd322e533afb4c532b734d8e1'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
