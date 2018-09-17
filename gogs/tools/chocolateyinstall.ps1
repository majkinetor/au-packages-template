$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.66/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.66/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0620f201b53f24ba8d2c29c54585609f73890f67e3fb843dc4fc708a14bf2592'
  checksum64             = '2ff78e94f03e6cc02e819dd6e1a45bacd3a5975cf570b3b8dd73c9cc1d0215c1'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
