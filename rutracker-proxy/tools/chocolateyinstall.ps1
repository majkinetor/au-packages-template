$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.1.3/rto-proxy-installer-WINDOWS.exe'
  checksum               = 'f8009d7e59c51fb209b624a333893a8a1eb9c4be51ee23a257bd7681439fbd36'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
