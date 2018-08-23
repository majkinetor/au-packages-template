$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.advanced-ip-scanner.com/download/Advanced_IP_Scanner_2.5.3581.exe'
  checksum               = '49AFD1429544C5F722C188C299287014E4D24AD8C5F32EB0AA9D8B8C32FC03BE'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
