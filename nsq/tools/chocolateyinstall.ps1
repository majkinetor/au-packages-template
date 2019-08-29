$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/nsqio/nsq/releases/download/v1.2.0/nsq-1.2.0.windows-amd64.go1.12.9.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = 'e7515ecadd742cfe45713f564dd21ee3b8f5aa8e17ae34f977ad0ecae81ad960'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  FileFullPath           = "$env:TMP\nsq-1.2.0.windows-amd64.go1.12.9.tar"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Get-ChocolateyUnzip @packageArgs
