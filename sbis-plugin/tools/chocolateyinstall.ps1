$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/verysilent /SUPPRESSMSGBOXES /NORESTART /notShowInstallInProcessMessage'
  url                    = 'https://update.sbis.ru/SbisPlugin/master/SbisPlugin.exe'
  checksum               = '42ba6270f64c021e0c666bb333c359fda6fb5eb99257e4f1d0c6d40924ca28d3'
  checksumType           = 'sha256'
  ValidExitCodes         = @(0,1)
}
Install-ChocolateyPackage @packageArgs
