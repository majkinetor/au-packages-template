$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\Fintender.Installer.Setup.exe"
  url                    = 'https://private.fintender.ru/files/Fintender.Installer.Setup.exe'
  checksum               = '5ad56b86cb94cb5908a34afb15699e99f78798b2770d23ec8d65237cd62ae938'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
