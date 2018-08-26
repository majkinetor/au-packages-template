$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'http://download.teamviewer.com/download/version_9x/TeamViewerQS.exe'
  checksum               = 'f62370a98b3e8c4cb956619417fe9faab28419eaa7a4b3957dbdc5c2112beb7a'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
