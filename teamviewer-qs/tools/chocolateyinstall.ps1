$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'b37af3eae8f66866a03ffbe878520047ceed55fb882f155b8cbf30480833848e'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
