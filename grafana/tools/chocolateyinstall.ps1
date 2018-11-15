$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.4.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '93c701951dca7e8fa15351c1c2b97d5106f5ece2ef281756d96e95184dfd1fec'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
