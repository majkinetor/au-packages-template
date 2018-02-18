$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'http://www.seriosoft.org/dl.php?file=MKey.exe'
  checksum               = '15e2f9a05b93279f39c5f3705dbb840782679266b901c28b01bc6be98b84cae2'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
