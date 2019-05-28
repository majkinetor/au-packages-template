$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.1.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '19aba43ed8f11c7351d87d7a5fbf41b4e00db915cf3d8e70be8b06fd6bb187e2'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
