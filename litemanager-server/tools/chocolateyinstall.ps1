$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://litemanager.com/soft/litemanager_4.8.zip'
  checksum               = '8b1d22bbf9e7e9095dce9d3129c0ac6cbab8017e6d42f96179da0e565b58d341'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  File                   = "$env:TMP\LiteManager Pro - Server.msi"
}
Install-ChocolateyInstallPackage @packageArgs
