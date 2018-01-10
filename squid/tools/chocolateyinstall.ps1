$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'http://packages.diladele.com/squid/3.5.27/squid.msi'
  checksum               = 'a5bbc48e3b2b274a6625cd29b605b21b1b9241b319d3d1423fcc6baf9ebcaa66'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
