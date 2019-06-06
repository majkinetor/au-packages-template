$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c44ae0019834a73860ba9804965b79235be9284017d716823c316ac6b24abc4f'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
