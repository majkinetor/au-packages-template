$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '66e7a3739f7eecdc9c930777d226c846be1ba54143b603e1ef1f5e41cca4c6f6'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
