$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.12/3proxy-0.8.12-x64.zip'
  url64bit               = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.12/3proxy-0.8.12-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'dbb3540adffa00ed8e2c322f29222feae9519b012559fe41bf170fa968d7f7d3'
  checksum64             = 'dbb3540adffa00ed8e2c322f29222feae9519b012559fe41bf170fa968d7f7d3'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
