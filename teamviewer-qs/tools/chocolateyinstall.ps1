$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '4774201cd81354c64f90f1051f7b62225eb776ff94c07d7a7b57a7f5df5d3be2'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
