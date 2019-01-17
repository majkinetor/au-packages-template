$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.4.3.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '3f94f251f1de13a86fa449818560272b6d6dc130062ca2ef0fa1f97b63b6aa37'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
