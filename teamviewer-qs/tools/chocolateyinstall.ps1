$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'c3add377b6da3cfb9144de4ecd7e2f63692bcdc0f31d81c62732db20a44b92d4'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
