$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.cryptopro.ru/sites/default/files/products/stunnel/stunnel_win32.zip'
  url64bit               = 'https://www.cryptopro.ru/sites/default/files/products/stunnel/stunnel_x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '7e0a5a3ec0b5eacb71f5b7e84b36ec89e879a10e61e46d1e272b13c6e7a3181e'
  checksum64             = '8d4563ffa9f93ba9a628544cc7b2fd9a40a82e82b29da1e03f774fa98dda11b8'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
