$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.advanced-ip-scanner.com/download/Advanced_IP_Scanner_2.5.3784.exe'
  checksum               = '1976e556909dd8d8c3b901965333b171ad5986593c83ff4b061814126de49a82'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
