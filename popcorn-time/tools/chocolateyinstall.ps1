$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Setup.exe'
  checksum               = '46b7735ea11bc82b31a86920ad3207370ed8ad8525c06f4b72710fc9966caab6'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
