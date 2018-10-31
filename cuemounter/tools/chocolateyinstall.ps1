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
  File                   = "$env:TMP\releases\./0/c67ade99-20ef-4569-bdc3-99575e816319"
}
Install-ChocolateyInstallPackage @packageArgs
