$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'a6eacaa31ca36bc8872bd9a433ff128f6c916bf8683a8a31f10f57d481cb9301'
  checksum64             = 'c56762451fc4a73b984afbb2bc9cb9c208d7ec828ea46f185bf4c5aeebcaece4'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
