$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
  checksum               = '15c1e219929c1ff6af165287e1384d4a881191b86bd0c847a6558706da68e5c1'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
