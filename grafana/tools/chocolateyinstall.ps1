$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.2.4.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2ef5735b3622df0be9df5f582975dda5a26c2589d587300cf8ed346dfced8264'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
