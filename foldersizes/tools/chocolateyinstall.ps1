$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/KeyMetricSoft/FolderSizes/fs8-setup.exe'
  checksum               = '018ecb19f99e6de148a9f9e423d849ad816e82e5139bcbd3e1f4b59cecedefee'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
