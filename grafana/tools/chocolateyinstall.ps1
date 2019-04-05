$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.1.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'b39845d807f238c5480aaa6e9b751b879c86ba6f0076940fd29e6c2ee166d4ba'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
