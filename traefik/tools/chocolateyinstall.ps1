$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.6.5/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.6.5/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '9b5e71c45a3489c5396ba8a7201c0e82a6ed4cce80e4ac3f775851c998bafed0'
  checksum64             = '8f5639b1e132af220cbb6810d5e55574f84c2dc9f121b95fcc8facd12ccbc9dd'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
