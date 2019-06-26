$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.5.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c87712dd8d2f4fa77daef5ec63811d2492133ea44839ce9207a1a1cf3549cddd'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
