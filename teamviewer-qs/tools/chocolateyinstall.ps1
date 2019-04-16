$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'dbac2232d8f2be82962c17e11a36b1e30b4e459235dbd0a43353c8b47981a365'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
