$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = 'f200b66bda33cc441303c2c697bbf95b616c765a303065d4dbb50312b7b9aae4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
