$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.0/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.0/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'dff7018aeb9b775619fdcc15e28318733defcdac24e34bb5e406790af8bd3650'
  checksum64             = '710819197badf26c4b7def2f5e4ade3e90a4bc37dd7e5e947f4a212a3d65d199'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
