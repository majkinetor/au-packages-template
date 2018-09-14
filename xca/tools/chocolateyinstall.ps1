$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/chris2511/xca/releases/download/RELEASE.2.1.1/setup_xca-2.1.1.exe'
  checksum               = '42635b17c3a92b3aa4bc59307a80225cbfa7c553957c1dd59c1fd3aeee022df0'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
