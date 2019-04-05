$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\cspclean.exe"
  url                    = 'https://www.cryptopro.ru/sites/default/files/public/cspclean.exe'
  checksum               = '9671ef97597e1f6cd68126a046c7a56d6b1d81042f2a779a44a4a01c73c5b9e8'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
