$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://codeplexarchive.blob.core.windows.net/archive/projects/DokanDiscUtils/DokanDiscUtils.zip'
  checksum               = '95105e9bab32b3db8b273b6306f2d524c8ca118b765daddcb0f6216eadcc6e0b'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  FileFullPath           = "$env:TMP\releases\0\45398509-9791-4261-9d72-c09368fbb176"
}
Get-ChocolateyUnzip @packageArgs