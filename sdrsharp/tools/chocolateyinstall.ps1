$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '57cf6a87b75b481f4a4c52a8cf105df72915676d94ace519029f850716e9d4cb'
  checksum64             = 'ab492ba79df6ceb5d4543b4f4bee2823050298d104b6ca09e2b61f47fdb4ca47'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
