$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\cspclean.exe"
  url                    = 'https://www.cryptopro.ru/sites/default/files/public/cspclean.exe'
  checksum               = '5185d970e2e4f4747ec691d7db35ef75683f4612f74cddc070afe4b84e9f372d'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
