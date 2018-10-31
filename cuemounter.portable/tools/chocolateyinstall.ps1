$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://codeplexarchive.blob.core.windows.net/archive/projects/cuemounter/cuemounter.zip'
  checksum               = '1e7565d59e38a14208ecb750ddd6fb4858651dacaef03e14c1c7dca85bebbc15'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  Destination            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  FileFullPath           = "$env:TMP\releases\1\d1cecb83-a87d-45e7-9976-8fb340566dc5"
}
Get-ChocolateyUnzip @packageArgs
