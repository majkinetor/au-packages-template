$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/nsqio/nsq/releases/download/v1.0.0-compat/nsq-1.0.0-compat.windows-amd64.go1.8.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = '85387972b26dc68c11e2c9332b80e8f0910815ddd0c3b902e8ba8346f6711926'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  FileFullPath           = "$env:TMP\nsq-0.3.8.windows-amd64.go1.6.2.tar"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Get-ChocolateyUnzip @packageArgs
