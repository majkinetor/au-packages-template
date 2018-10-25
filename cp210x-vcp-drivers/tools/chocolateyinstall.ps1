$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.silabs.com/documents/public/software/CP210x_Windows_Drivers.zip'
  checksum               = 'c3e68e0314199f17cfdfecb1c041bd8a10d3623ccb8b037ff1d1576b51833be5'
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
