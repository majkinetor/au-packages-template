$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.3.6.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'a8f4c8c9dfdccc7d71ec20ce3b05fe474c89fa4ff85cc1c061eeadfc9f0a41b6'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
