$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\DWS.exe"
  url                    = 'https://github.com/Nummer/Destroy-Windows-10-Spying/releases/download/2.2.2.2/DWS.exe'
  checksum               = '2f50ea4dd2b4a90622d1ba9d9b68dd40f1941f3a913b5d449100055a21552bf4'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
