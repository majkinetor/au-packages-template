$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '59648e1472c318170a08d5c6837ca1ed5787c7c05841593c1c9968bb2616f894'
  checksum64             = 'cdac015aba8189a5dce2b6bb3215fdc191d45853f51955096976210c143df1e1'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
