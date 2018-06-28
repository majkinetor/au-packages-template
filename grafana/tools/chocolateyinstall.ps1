$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.5.windows-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e9561b4f7d4427cf9cd620ef58d45182407e11478613daf0eb6e2c4a92ab5b71'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
