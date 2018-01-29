$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://www.gsm-sprut.com/files/file/SprutUniversal/sms/smsserver.zip'
  checksum               = '70d59ef605cf28d03443c2d17529d045c7c69076007aeb233a24202b482a1cf0'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  File                   = "$env:TMP\sms_client_setup.exe"
}
Install-ChocolateyInstallPackage @packageArgs
