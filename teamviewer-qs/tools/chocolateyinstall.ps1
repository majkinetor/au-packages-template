$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/version_13x/TeamViewerQS.exe'
  checksum               = 'b960e1a046c1fab88aafcbe2488121a674df61c85f7b13cf818f08fcf56a8dc1'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
