$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.6.6/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.6.6/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '4ee54515f02200c54e812767c4c60ea0f54be6864bacbb447d6690a311a19629'
  checksum64             = '256a1e35aa2ec372990f6bf504886aaf6c9fa9a8cdc0fa4857f42acaecb4ffa7'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
