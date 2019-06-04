$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin.msi'
  url64bit               = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x64.msi'
  checksum               = '516456512351ce89d372071cd9ffa4a960425a269c1f685e1f08e71052460f13'
  checksum64             = '99f674890686bac277d396888da7d25aa989cc05accac48b3fc5be8f5e2b0773'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
