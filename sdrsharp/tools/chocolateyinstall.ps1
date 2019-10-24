$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '367a38dee1ba4bed3f44ba784d66ed09ce8ea5f2eb640155ca23bef896157f0d'
  checksum64             = 'fecce310f353e7c2df606b9a01fd714adbb9986a4ba2abe62ec62a1f04550baa'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
