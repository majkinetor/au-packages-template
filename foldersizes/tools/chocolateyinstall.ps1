$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/keymetricsoft/FolderSizes/fs9-setup.exe'
  checksum               = 'fb6f86a1e4743f98954ba698d5a8269c0b02434ea4b0b20237c1cada97224d92'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
