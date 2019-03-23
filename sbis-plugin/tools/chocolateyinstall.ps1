$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/verysilent /SUPPRESSMSGBOXES /NORESTART /notShowInstallInProcessMessage'
  url                    = 'https://update.sbis.ru/SbisPlugin/master/SbisPlugin.exe'
  checksum               = '847f7eade2daf78985a74fa37dea641f83509133fccaa37183e74d6fdc6b7cb6'
  checksumType           = 'sha256'
  ValidExitCodes         = @(0,1)
}
Install-ChocolateyPackage @packageArgs
