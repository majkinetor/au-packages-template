$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/KeyMetricSoft/FolderSizes/fs8-setup.exe'
  checksum               = '1b80c3b072e2944089d16b8fa294f4d27e70067ef4b870e9e1f65074a5c5d0ad'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
