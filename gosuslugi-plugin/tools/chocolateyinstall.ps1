$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin.msi'
  url64bit               = 'https://ds-plugin.gosuslugi.ru/plugin/upload/assets/distrib/IFCPlugin-x64.msi'
  checksum               = 'c48a6aea7dfd8e77b17a6136066343639d3f14a167db0a7f4ea265d5753da677'
  checksum64             = '71955a685fd1afeb94d252541102200b95b79e8b4e7714c7fc4668d10c06e108'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
