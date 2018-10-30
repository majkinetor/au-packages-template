$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/s /sp"/qn /norestart"'
  url                    = 'https://www.gnivc.ru/html/gnivcsoft/ppdgr/1.4.11/Setup_PPDGR_full.exe'
  checksum               = '3d3947c1cff26e19ae317afe031b0a0882324b6e55db8451e7b250874761e3c4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
