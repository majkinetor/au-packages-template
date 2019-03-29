$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.advanced-ip-scanner.com/download/Advanced_IP_Scanner_2.5.3850.exe'
  checksum               = '87bfb05057f215659cc801750118900145f8a22fa93ac4c6e1bfd81aa98b0a55'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
