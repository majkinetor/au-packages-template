$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\cspclean.exe"
  url                    = 'https://www.cryptopro.ru/sites/default/files/public/cspclean.exe'
  checksum               = '2a9d80165e95ba52ad93c4baee282bcb2c6770419484927905c00b47d3a9e72b'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
