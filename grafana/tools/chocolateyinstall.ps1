$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.3.5.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '88634f80163b8d92784be4af6d8db6f7fa73a326f5c17554b08a233be1d0aba3'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
