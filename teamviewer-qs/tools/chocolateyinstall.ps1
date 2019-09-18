$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '31dc8f0907a4aaca6264bc9844f55f0dcbdc6f59a852d5d5de1b18b2a1964c73'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
