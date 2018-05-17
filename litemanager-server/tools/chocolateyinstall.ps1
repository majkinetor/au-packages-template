$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://litemanager.com/soft/litemanager_4.8.zip'
  checksum               = '5e27c47fac38ef31467776b3872a2033c599d3cbd91cfbd5109e84509f0e14b2'
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
