$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_windows_i386.tar.gz'
  url64bit               = 'https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_windows_amd64.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = 'd5f907200d7a49131ceea04d2d70bf903fde6985fd1c60106d98ab5cef5146c6'
  checksum64             = '933bedeb12d09be373924a40975232eb3c15030f4cea3599278f35289e4872e2'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  FileFullPath           = "$env:TMP\remote_syslog_windows_i386.tar"
  FileFullPath64         = "$env:TMP\remote_syslog_windows_amd64.tar"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
}
Get-ChocolateyUnzip @packageArgs
