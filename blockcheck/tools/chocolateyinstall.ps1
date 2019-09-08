$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath                = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\blockcheck.exe"
  url                    = 'https://github.com/ValdikSS/blockcheck/releases/download/0.0.9.7/blockcheck-0.0.9.7-windows.exe'
  checksum               = '4292dcc59328cf70e16493b4e959e35d2cf9e732ac7922b6d031ff8aa53920a0'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
