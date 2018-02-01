$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = 'd2275e54db7430a3c28a37f82f715aeeca3fdc4b9808b47ffc7de50fe142a8cb'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
