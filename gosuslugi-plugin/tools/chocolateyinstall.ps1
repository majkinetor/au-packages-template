$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin.msi'
  url64bit               = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x64.msi'
  checksum               = '7bf743f5a9b59af46cde0740e89b2968e243da79f2b87dc830d5a5161e70e5fd'
  checksum64             = 'ad45043d041d5d2f4f5424f709dc40744cd9d8f1929386e57b8971406b360b72'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
