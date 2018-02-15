$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath                = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\DWS.exe"
  url                    = 'https://github.com/Nummer/Destroy-Windows-10-Spying/releases/download/1.7.1.0/DWS.exe'
  checksum               = '2bfc72791f0e222a790e88895a143aac02c1c67ffc3f663cfb5c2461683d96b4'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
