$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '5329e2eee28a1c256e4989b232cda992bd118c72d65861ddce5153ec4f8a2a12'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
