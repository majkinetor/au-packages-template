$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://gnokii.org/download/gnokii/binaries/win32/gnokii-0.6.31-release-setup.msi'
  checksum               = '21bf1b615f764b814214d9367ddd3f5312d3a4c5a4345caaede9810a30d37ccc'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
