$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.2.windows-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '777f8568464d9178198573b45728f518d0bea6845a50b6cd496cd9acd1a7d747'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
