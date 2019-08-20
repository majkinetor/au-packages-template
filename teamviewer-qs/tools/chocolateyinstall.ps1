$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '03fb3ac4ea944e49791bb912bc5e7f736205220d270e975168c5dae534ef1f1c'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
