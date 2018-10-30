$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://downloads.sourceforge.net/project/mpack-win/mpack17.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '4becf318b00c3e6f72109956d35fb1f769064f57046a175dba5306b0c41efca5'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
