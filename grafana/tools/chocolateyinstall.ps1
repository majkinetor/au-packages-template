$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '560911c16e4bf177e2fcff69aee28899fa709dfd49611ee9cb0d6d8c5f098a1b'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
