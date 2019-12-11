$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
  checksum               = '5a0be1dcdbbb71ea1f46b0fa1771e0c2dc45df5de7ae1f90039254f86e347297'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
