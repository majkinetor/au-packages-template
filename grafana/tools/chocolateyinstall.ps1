$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.4.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e915670d9fd3e99a92bacefc026e9ef8f9e3687cbecc860397d0dff72c7bb70b'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
