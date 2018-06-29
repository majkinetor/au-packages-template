$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  url                    = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-3.0.0_fuse-nfs%3Dmaster_dokany%3Dv1.0.2/i686-w64-mingw32.zip'
  url64bit               = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-3.0.0_fuse-nfs%3Dmaster_dokany%3Dv1.0.2/x86_64-w64-mingw32.zip'
  checksum               = '09a777ed122470907b7dab33ecdd68ae2ad1900d30fb49380da1007f77794351'
  checksum64             = '4bc947c0df579a9c8fe13c9c0a7c63ecd36f8464ad602dc51b7775a3826cef2c'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
