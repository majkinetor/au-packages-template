$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://download.rutoken.ru/Rutoken/Utilites/rtDrvInstallTool.msi'
  checksum               = 'bd21a5c48b9daefa68beb7cda29bdbeb1f8bc51a0e80826be8e614e30df01907'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
