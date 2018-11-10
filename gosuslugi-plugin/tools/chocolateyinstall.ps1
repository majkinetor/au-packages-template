$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin.msi'
  url64bit               = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x64.msi'
  checksum               = 'b5384e5ae84a88205a020a59b97c1e4a7920b5cbca3954b383117483274f547a'
  checksum64             = '751ca0dbc6d41f38edb7e1d839cf4382d6d8478f610e5241ec79d51f35210a95'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
