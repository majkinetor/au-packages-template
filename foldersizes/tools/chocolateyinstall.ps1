$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
  checksum               = 'fe1692b446228030d7918a2e6d5f54eb5b61626ab572334509a588c42e4f04cf'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
