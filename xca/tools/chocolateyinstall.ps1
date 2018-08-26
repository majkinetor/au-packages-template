$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://github.com/chris2511/xca/releases/download/RELEASE.2.1.0/setup_xca-2.1.0.exe'
  checksum               = 'b519aec836d9d4888a2606dc1f3b40077ed17f67caf73ce8b8b3b38f7ccb71db'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
