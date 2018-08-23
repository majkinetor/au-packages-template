$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://www.advanced-ip-scanner.com/download/Advanced_IP_Scanner_2.5.3646.exe'
  checksum               = '02ec949206023f22fe1a5b67b3864d6a653cc4c5bfcb32241ecf802f213805e8'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
