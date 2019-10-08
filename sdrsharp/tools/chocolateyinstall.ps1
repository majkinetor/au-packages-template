$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'e77eab72196e559d14b66736ee48085ce23f7de391dd73263acb0892f10f6fd6'
  checksum64             = '9b112930c920bbbd50cd3cdc45bac0e0c667a0c6441668a35e8793a67cbf5962'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
