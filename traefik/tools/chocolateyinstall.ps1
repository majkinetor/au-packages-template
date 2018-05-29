$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.6.1/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.6.1/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '6d7e293292d673049ae7433f17cc909aed33c7d69d0895c67f53c2cd3f8d3c26'
  checksum64             = '4c495cc2f1d379f8b120710bbd6766f1929f9f0ceaa62d5d167ce9e1e1268f5d'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
