$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.4/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.4/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'dc2fdddb75cc06bbafbdd496fd0f2ad837b8bf29c37e4ec6084494e04ca8bb3d'
  checksum64             = '10726dedbab776d8621b59e6233f1d6e7a9e7fae43ff3080eac1846b148ab814'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
