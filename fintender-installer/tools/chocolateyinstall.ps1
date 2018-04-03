$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\Fintender.Installer.Setup.exe"
  url                    = 'https://private.fintender.ru/files/Fintender.Installer.Setup.exe'
  checksum               = '02aeacc95194c188ce1cf2d3867ad47810b9add2f4a7c422dd10d2178e8adae6'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
