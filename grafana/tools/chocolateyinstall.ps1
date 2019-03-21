$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.0.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '53d7848817f125a3981eb8b598822601acfbd8704b55efdcf82e74667c7f0969'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
