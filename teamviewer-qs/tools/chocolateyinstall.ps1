$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '38d6a30b501371cc1dd755850e4489b163ea48e4d07c5d8248386b34f0e39d78'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
