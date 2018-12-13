$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://s3-eu-west-1.amazonaws.com/jivo-userdata/stable/jivosite.msi'
  checksum               = '0ba32c776e2f924a522e9cef3ff94e8bd6340b3e43b35ae91859529335d874f7'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
