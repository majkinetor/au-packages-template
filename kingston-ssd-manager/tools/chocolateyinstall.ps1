$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = 'be4a44137aa604562e24e6f5aeecb62339f8ae6f0a65af487d32b5920b2a6fab'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
