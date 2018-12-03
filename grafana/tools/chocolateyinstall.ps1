$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.4.0.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e9b6cb2bafd552080e2d8d78727d64ff8592e0d63556b0889cc3be4ef685daa8'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
