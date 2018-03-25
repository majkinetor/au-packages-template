$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/RutrackerOrg/rutracker-proxy/releases/download/v0.2.3/rto-proxy-setup-0.2.3.exe'
  checksum               = 'a1711839fe853a91e77b6a794f24c624541b00dd8bb2790bb20e450de84c31a5'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
