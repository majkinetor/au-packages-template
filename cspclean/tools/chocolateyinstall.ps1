$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\cspclean.exe"
  url                    = 'https://www.cryptopro.ru/sites/default/files/public/cspclean.exe'
  checksum               = 'f18310989e9ed84636c4aec8be4c983a0beef9f24bdd6c57867de0d3c95ee7a8'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
