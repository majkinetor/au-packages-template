$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\ninefs.exe"
  url                    = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ninefs/ninefs-20100121.exe'
  checksum               = '01676879c8f1e9bf2047ebf4c84e96bca7a5d88844d350f5f374dbc980f87979'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
