$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath                = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\DWS_Lite.exe"
  url                    = 'https://github.com/Nummer/Destroy-Windows-10-Spying/releases/download/1.6.722/DWS_Lite.exe'
  checksum               = '0f99eaf92a96c7103a971acfbf6d13cf84f504a5049ee0619bf55bcf89cef53b'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
