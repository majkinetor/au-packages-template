$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'cfd4549e87cd16618eb8e794b83ce97ba24cfa1bf9e3a26e5584cb052894b92d'
  checksum64             = 'b7eecb794e329244e16962ef8a57547132cb6681d9bf562d26e342180a4c1671'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
