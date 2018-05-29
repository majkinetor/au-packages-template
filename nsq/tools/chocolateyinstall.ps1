$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/nsqio/nsq/releases/download/v0.3.8/nsq-0.3.8.windows-amd64.go1.6.2.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = 'ea18e9e193e83b5c42b4faa0cf07a285829c79726d2c980cf2d24b6b0e1961fd'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  FileFullPath           = "$env:TMP\nsq-0.3.8.windows-amd64.go1.6.2.tar"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Get-ChocolateyUnzip @packageArgs
