$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.0.0-beta2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2a86f24d3184e025438dd6e03a152a1081f621c23e31e4c6309a51c6dcc2afcd'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
