$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'b2e3946fde991d991ef28c181be540031acc99771347d03e7ac7cdca6992c28f'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
