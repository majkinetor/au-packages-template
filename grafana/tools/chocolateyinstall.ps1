$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.4.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'b0a5b0858a5f50129ab76c34bddf669df53225876615bb5d0fb94d74beaffd91'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
