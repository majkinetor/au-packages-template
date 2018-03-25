$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://s3-eu-west-1.amazonaws.com/jivo-userdata/stable/jivosite.msi'
  checksum               = '9b73c54d61e6e16d8bd6bb55a52a0228346bc31e4e89080c2351f04e2f6ec02f'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
