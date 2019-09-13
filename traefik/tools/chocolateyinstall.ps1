$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.16/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.16/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'fe71def0e3b6505d1afc509d863336f04554c5a4a1dd03a43fcf41f66a61df4a'
  checksum64             = '74f187f1bb31e0be1a6269ead08595dd50dca55cabb74120c6cea4ca4bdae83d'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
