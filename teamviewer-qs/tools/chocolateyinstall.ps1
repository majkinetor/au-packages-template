$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'e54ae8ac2174cb33fd5457027961bde16951d8ad48db48090e75bdf709759d33'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
