$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'https://media.kingston.com/support/downloads/KSM-setup.exe'
  checksum               = '675bb5a1d7a10eb8e952eef12c43f3a162d72567d46ce1092d89bc7ec1ddab54'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
