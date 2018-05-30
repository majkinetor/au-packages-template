$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.1.3.windows-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '6b93d063c693a730fd38a6d024fdf5ff9d49dd43f5698c9be931272ccfb4b074'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
