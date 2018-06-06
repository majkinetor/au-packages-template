$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.6.3/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.6.3/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '8a93b7a1c1e2b4d07b66d801fe0e8ee80df9aeebd58ca55d278a366c25ee8a9a'
  checksum64             = '89bd3e076b729f8745e0439de27bb0230a34fbf8ac5dfeb9bd05c98ba961b666'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
