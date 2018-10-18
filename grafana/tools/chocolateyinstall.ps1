$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.1.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'cecc4aaf221c2504f8a735a6f87eb66b1a53e7d7f8c5dbae290150ec2e552c30'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
