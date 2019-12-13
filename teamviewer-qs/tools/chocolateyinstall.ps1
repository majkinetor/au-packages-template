$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/version_14x/TeamViewerQS.exe'
  checksum               = '70513236b8f912a3ffe5e1a41774a4490fcbb624cb30b056a38b9ddb3db1cbe2'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
