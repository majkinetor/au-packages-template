$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '19b224ebf092850938d41fd68767743204df64586c518bdd23623d13b88831b6'
  checksum64             = 'cced6e996ce7d60a8badf449f4cf360559ec1c1a1b256aa412f408f7ab25cf40'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
