$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '7c428c63efa261dd07b68d474cad91bb22d1a296f6de4d1184c46734ba7ccb3b'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
