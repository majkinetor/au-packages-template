$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '06bc4df1960a3125b1538923af5f5d64555ee4772a49f13b8752330a38e5235b'
  checksum64             = 'f02d3c135794bd5ffaa66a82a2fa16be47ce4c89a419a7a651c9200f7c6e04a6'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
