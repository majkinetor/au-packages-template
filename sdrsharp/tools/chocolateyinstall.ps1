$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bfe802aae623f8958c11892f9f9d17c468308d33c9482b96f95057191fc2dc19'
  checksum64             = '880b8d7a8156f940f2fe37b1739617a5ea33d783d42edbf1d71f50b93a19a081'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
