$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '9921bde581c0181335e742dffc9fe50e032ffdcd04b53b1d41c717351dc77c07'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
