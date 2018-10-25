$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.silabs.com/documents/public/software/CP210x_Windows_Drivers.zip'
  checksum               = 'd8ed371935db1081c79d7f3857c4d1bc0c13590210f716e02c783508967b5125'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP\$env:chocolateyPackageName"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S /SE'
  File                   = "$env:TMP\$env:chocolateyPackageName\CP210xVCPInstaller_x86.exe"
  File64                 = "$env:TMP\$env:chocolateyPackageName\CP210xVCPInstaller_x64.exe"
  ValidExitCodes         = @(0,256)
}
Install-ChocolateyInstallPackage @packageArgs
