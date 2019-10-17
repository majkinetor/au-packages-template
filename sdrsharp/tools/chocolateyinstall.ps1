$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '261a17f1eaec73126a5ca3c50dd8c9d8a0dd4db2df826f8e85b8b467a2e32144'
  checksum64             = '1850fc46fcf4866749324d8e6513dcfab97276dccd46795d231c9b1636f70fe3'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
