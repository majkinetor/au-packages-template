$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/nsqio/nsq/releases/download/v1.1.0/nsq-1.1.0.windows-amd64.go1.10.3.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = 'b309014ec223c13377b99e8f803c8e16b4311c872276f7ad1999a0769be3c89d'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  FileFullPath           = "$env:TMP\nsq-1.1.0.windows-amd64.go1.10.3.tar"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Get-ChocolateyUnzip @packageArgs
