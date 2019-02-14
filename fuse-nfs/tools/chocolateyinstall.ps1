$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  url                    = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-4.0.0_fuse-nfs%3Dmaster_dokany%3Dv2.0.0-BETA1/i686-w64-mingw32.zip'
  url64bit               = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-4.0.0_fuse-nfs%3Dmaster_dokany%3Dv2.0.0-BETA1/x86_64-w64-mingw32.zip'
  checksum               = '33fe198437cf02eb0b724e27b1d0a8ff4eafd927efcd3727d77e7f2dee8e810c'
  checksum64             = '5d78de9d2a2ea2011de97b0751eaddef27f76243d0861188cb72610ce25ff896'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
