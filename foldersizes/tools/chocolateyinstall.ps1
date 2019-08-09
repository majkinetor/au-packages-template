$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
  checksum               = '1e44a07495043f45b8c3270317e00719ff0361a4bcb3f95fbba43df9a407c1b8'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
