$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.3.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ced1b28c8154e04fa11337c87f4db1ce1b5405019446ac3394ba767f537f1220'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
