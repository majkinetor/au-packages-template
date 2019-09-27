$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '22b3ae53e65c24d37e1927c7b8f260e457b44a6b998bf541dedba5a3c0cf84db'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
