$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\TeamViewerQS.exe"
  url                    = 'https://download.teamviewer.com/download/TeamViewerQS.exe'
  checksum               = '6473d24aaa84075d8a1a4311cfab5c647c14cbb3df3785a196a3f2e257e0e52f'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
