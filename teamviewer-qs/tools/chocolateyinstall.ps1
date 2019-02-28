$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'bf21c81bd452cde8e8bbbc696b7b1426f85cb6beff927418b549c3dfd9335653'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
