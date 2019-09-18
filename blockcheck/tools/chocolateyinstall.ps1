$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath                = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\blockcheck.exe"
  url                    = 'https://github.com/ValdikSS/blockcheck/releases/download/0.0.9.8/blockcheck-0.0.9.8-windows.exe'
  checksum               = 'a4bb858a29d186bd1adff8984989b466c2ad18b1134e57bf82aeba2d7631fb13'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
