$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://reqrypt.org/download/reqrypt-1.3.1-win64-install.exe'
  checksum               = '0f109c1c0ecb42dcaa4251a833c709de0979b6c4cb88b3712dc1c998b6c0c284'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
