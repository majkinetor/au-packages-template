$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.6.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '178e6fb92dfb560fa4f2871bccb93a37283a35cc8ce40a3b6962ccb92e645f33'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
