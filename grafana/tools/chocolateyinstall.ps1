$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.0.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2785f021c313d4e7d1de426e0eeb64d4db9ebe47f95fc4d32e4a330e7c86aeb9'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
