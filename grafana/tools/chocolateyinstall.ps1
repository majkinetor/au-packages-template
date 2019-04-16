$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.1.4.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e886227edbab9e7a7299857d1760c8e45998a2775bc220b5dc4435e72ae53832'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
