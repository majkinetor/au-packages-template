$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  url                    = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-2.0.0_fuse-nfs%3Dbdd4e2bfede5ced1e1d1ab21c7652e9905b7f668_dokany%3Dv1.1.0/i686-w64-mingw32.zip'
  url64                  = 'https://github.com/Daniel-Abrecht/fuse-nfs-crossbuild-scripts/releases/download/libnfs%3Dlibnfs-2.0.0_fuse-nfs%3Dbdd4e2bfede5ced1e1d1ab21c7652e9905b7f668_dokany%3Dv1.1.0/x86_64-w64-mingw32.zip'
  checksum               = 'ac68c8845a869fabf90dc16e3bc309130fffd337493fed25eb41d1f45f7528dd'
  checksum64             = 'bb1e7a1b97f37ff0abe841c8e7a6470a5ddd456350e1e018d3edfc1f5b899c15'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
