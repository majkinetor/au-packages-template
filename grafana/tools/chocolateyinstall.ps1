$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.0.0-beta1.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '664c0a73b15fddc92e64048ba5707882f166f77b6f00c1eb19b4ffc2753a5e6f'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
