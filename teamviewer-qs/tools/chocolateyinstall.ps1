$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = 'bfbd20b7de4c831af337ddd47008742facf0244e08d6fb3716573492d3d19eb1'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
