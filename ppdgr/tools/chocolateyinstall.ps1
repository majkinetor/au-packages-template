$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/s /sp"/qn /norestart"'
  url                    = 'https://www.gnivc.ru/html/gnivcsoft/ppdgr/1.4.9/Setup_PPDGR_full.exe'
  checksum               = '3ee30b3ed946b9bdc2e18835a2cd8878a6ce824190d965d11129d72a96f2da2e'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
