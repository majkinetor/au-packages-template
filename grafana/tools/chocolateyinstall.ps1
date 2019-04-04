$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.0.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '66e844d874e2ef76d46e3f5c778f7e905d83720b2ad80596a801ccb85c6162d8'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
