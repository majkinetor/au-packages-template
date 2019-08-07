$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-6.3.2.windows-amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9de02988b2b05e42b59c8414f1f8c3117a02eb0bf1dc731cba63657c3e57275a'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
