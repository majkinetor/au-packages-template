$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.6.4/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.6.4/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'd4d1d9ba33a4bf9abb6baece2c6143668118993d069210daeb6c61e7cdd456b3'
  checksum64             = '2b962547e9475e0cf685ac2ee8cba479680ba1845fc94b665c483f5a546398d1'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
