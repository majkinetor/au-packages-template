$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.0.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '233b6181d5c83e8ce60f364e9d63df24cd05267dd7aa67949ffa031392b6cf33'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
