$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '591992630cb21f917b0d93c3695f9542e1f87d4e677fabac1ce552e6cc72cb21'
  checksum64             = 'e61ec7b682c12f49b959fbb0a4b208b8bdb37ae1148ea6d020c70373cdffa944'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
