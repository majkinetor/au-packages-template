$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\ninefs.exe"
  url                    = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ninefs/ninefs.exe'
  checksum               = 'bda2b14ae66e9aff363ed642193b1badd3f3ee3e67b02bea281067e7a2baae8c'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
