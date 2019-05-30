$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.12/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.12/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = '26e091e903c6d1600928e090034e744b10870fcbe59f16ab0fea1448bccde014'
  checksum64             = 'eed06b953dc4f163b2a6bbe683028898920e097ada9a40902dbe962b10b01b23'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
