$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\rtDrvRemover.exe"
  url                    = 'https://download.rutoken.ru/Rutoken/Utilites/rtDrvRemover.exe'
  checksum               = 'ce43e623f53862bc0a29635087d24c89d0f35ca52d6d79278c62914da20f7b06'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
