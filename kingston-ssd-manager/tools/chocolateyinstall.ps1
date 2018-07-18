$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = '878477181f099210ea6cc315b0f977111c4ee36fab2315cd851d55d4f1bf0ed9'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
