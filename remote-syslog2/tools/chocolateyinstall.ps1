$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/papertrail/remote_syslog2/releases/download/v0.19/remote_syslog_windows_i386.tar.gz'
  url64bit               = 'https://github.com/papertrail/remote_syslog2/releases/download/v0.19/remote_syslog_windows_amd64.tar.gz'
  UnzipLocation          = "$env:TMP"
  checksum               = '2cdd4d3479fc62e8eb339fd474858bfe410c2126ea94cdc10f214c89e4d1fbe5'
  checksum64             = 'c30da4e57628a4902a0f7838c826a91e2a3b17d59fc1abe8c7e06446139325cd'
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
