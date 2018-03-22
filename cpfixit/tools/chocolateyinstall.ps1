$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\cpfixit.exe"
  url                    = 'https://www.cryptopro.ru/sites/default/files/public/cpfixit.exe'
  checksum               = 'b78f9f11461764e15ba5e167cea20ce67e0be4236d20e51b7459dd4192e929f5'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
