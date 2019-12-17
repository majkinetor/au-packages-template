$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '67816c035f4f3d79ec04b5d25e2cc7af78fd99935f6f206c65e8519e88d276d9'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
