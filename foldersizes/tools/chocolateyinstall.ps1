$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://s3.amazonaws.com/KeyMetricSoft/FolderSizes/fs8-setup.exe'
  checksum               = '4705855d459a47a7e26e9529ed83866045995090f96b9ffcc76cbec1ab2e86ee'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
