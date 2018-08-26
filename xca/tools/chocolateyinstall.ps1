$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://downloads.sourceforge.net/project/xca/xca/1.4.0/setup_xca-1.4.0.exe'
  checksum               = '676eaf24348a76bc311db959694c88be86386395686ba05fc1e63f985292aaf6'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
