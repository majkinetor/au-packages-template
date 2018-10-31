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
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  File                   = "$env:TMP\releases\1\c2f47213-bbd4-4541-b5e7-a9eab25dfc61"
}
Install-ChocolateyInstallPackage @packageArgs
