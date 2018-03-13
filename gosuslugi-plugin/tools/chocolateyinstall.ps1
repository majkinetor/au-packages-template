$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin.msi'
  url64bit               = 'https://ds-plugin.gosuslugi.ru/plugin/htdocs/plugin/IFCPlugin-x64.msi'
  checksum               = '08bffdc20e8be0bd6a3230d83fcce67fe0739b9fd899d929d669684ed699f16b'
  checksum64             = 'c3fd120d8c762c30d909c13ac06bef1c32ae333cd8eb1b7bcaa0e35a7a087397'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
