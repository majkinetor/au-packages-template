$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.4.1.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '69fc32bf0cc83dffd818f43bd68a73007dec1d0b124bb63072bdd2b5d2733f4c'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
