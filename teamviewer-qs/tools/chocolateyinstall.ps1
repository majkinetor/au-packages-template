$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '795fb2d62fe57ef4ce86aab94df0f16952e3de5f70c478b4da48e6b403ac946e'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
