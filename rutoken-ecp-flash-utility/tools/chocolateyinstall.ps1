$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\RutokenFlashTool.exe"
  url                    = 'https://download.rutoken.ru/Rutoken/Utilites/RutokenFlashTool.exe'
  checksum               = 'cbaa089c425395886477720088e159c3ea9f962c88b05d4bb4eacd54fe8b11e0'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
