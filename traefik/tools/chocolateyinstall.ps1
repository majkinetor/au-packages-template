$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.17/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.17/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'a36a62515c70dab7bb87d9089ad0e6638ac8a8e7d00875ff734468ab4c6caf8d'
  checksum64             = '18c1abd73469e74f7f795c7b32e9e81cd3be71b82f5a704f9792e0525eafb0b8'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
