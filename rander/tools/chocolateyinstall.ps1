$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://randersoft.com/download/Rsetup5.rar'
  checksum               = 'da270928ac3ed2f4bf572d9d5fda3bd0c3457fc168911d356ddbbca791814a03'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  File                   = "$env:TMP\Rsetup5.exe"
}
Install-ChocolateyInstallPackage @packageArgs
