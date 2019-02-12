$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.9/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.9/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '12d2e0288f3c29d5c6d42e6ac541421e7cd09a9fe4c61a3866b5a876f9ac0371'
  checksum64             = '88a8f2c7b0032a2edbf896153f9bbae4929872abb7fb51b9ffd0b136ce38a102'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
