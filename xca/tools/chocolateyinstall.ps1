$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/chris2511/xca/releases/download/RELEASE.2.1.2/setup_xca-2.1.2.exe'
  checksum               = '8dbdabde2df929019a8f3ce7bd7e1b5de180076edb4ccd5c76625d90fb97e3c0'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
