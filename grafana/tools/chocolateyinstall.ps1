$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.0-beta2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '90c3485c689f71560f8bcb8e47660a4fcede4617a36a7febb5a9d112de0fe06e'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
