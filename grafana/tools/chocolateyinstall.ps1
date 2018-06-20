$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.4.windows-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '529a4ead110e541a4c6d88cbedcbfee7b7e0153d725e8b13b9438a7b2a8c7be9'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
