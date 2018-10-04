$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://github.com/EvilBeaver/OneScript/releases/download/v1.0.21/OneScript-1.0.21-setup.exe'
  checksum               = 'a37161180f930d67692f6f4d42b04fe542ddefedb74853d7284af6da9493d957'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
