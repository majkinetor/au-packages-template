$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/containous/traefik/releases/download/v1.7.2/traefik_windows-386.exe'
  url64bit               = 'https://github.com/containous/traefik/releases/download/v1.7.2/traefik_windows-amd64.exe'
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\traefik.exe"
  checksum               = 'ffdf289aa6bdd2dfa1722a6f86d940b1eae83de4bc1d2e993b79768047e7a95a'
  checksum64             = '16e1690d95f27797ee6fbe578ba7ba3f531e0df4f61b6c215a7f0a454cdde743'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
