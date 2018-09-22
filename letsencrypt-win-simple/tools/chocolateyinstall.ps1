$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/PKISharp/win-acme/releases/download/v1.9.12.0/win-acme.v1.9.12.0.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ff79f34a204c57357079f40ffebbe9e400b9c84d4ca6198c4bb07e18ba69e879'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
