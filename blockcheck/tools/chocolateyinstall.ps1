$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath                = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\blockcheck.exe"
  url                    = 'https://github.com/ValdikSS/blockcheck/releases/download/0.0.9.6/blockcheck-0.0.9.6-windows.exe'
  checksum               = 'b5aa82ea803ccf7315ca53659b214aa9ed43aaf9a7d903bbcb77ac82811d0429'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
