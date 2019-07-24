$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '9e59bd143fc85a08e1ced5d5043d2176a19e33473b190b611948708a32e51a69'
  checksum64             = '98c3d824482b8cbe097825af435677f53dccef5a3a9be137f81a509b567296cd'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
