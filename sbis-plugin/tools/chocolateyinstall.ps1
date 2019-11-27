$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/verysilent /SUPPRESSMSGBOXES /NORESTART /notShowInstallInProcessMessage'
  url                    = 'https://update.sbis.ru/SbisPlugin/master/SbisPlugin.exe'
  checksum               = 'f3bbfa34dec4812ece6affd5d66787fdb3bffaa2c78cffa70f05ab40ef51b249'
  checksumType           = 'sha256'
  ValidExitCodes         = @(0,1)
}
Install-ChocolateyPackage @packageArgs
