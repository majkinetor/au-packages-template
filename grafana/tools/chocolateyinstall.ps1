$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.3.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c87f645204e14365771f8450de2583a71dbf13a056e0d32afbf2f12624ef49bb'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
