$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/verysilent /SUPPRESSMSGBOXES /NORESTART /notShowInstallInProcessMessage'
  url                    = 'https://update.sbis.ru/SbisPlugin/master/SbisPlugin.exe'
  checksum               = '3c1379df0d989cc9b169a0303aaf888903d8780589f335e20666b38ffd5e7445'
  checksumType           = 'sha256'
  ValidExitCodes         = @(0,1)
}
Install-ChocolateyPackage @packageArgs
