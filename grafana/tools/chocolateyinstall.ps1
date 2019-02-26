$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.0.0.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '8b74a18b8f467c46abcf96fbce2d8575d5a1a0e3afce6f9242c55224dd17e039'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
