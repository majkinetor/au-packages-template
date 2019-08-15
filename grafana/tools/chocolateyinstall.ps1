$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.3.3.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '5e70a38bb40f22370af3c4df9df3e86df72fef74de891a292114d53a524aba36'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
