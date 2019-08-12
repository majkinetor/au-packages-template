$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.91/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.91/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '52cf5e65ded83e94d784f2ac4392b2a4d999d291e07ff83673e35a81d487a47e'
  checksum64             = '30d524e2dc87f67d65a9a79205c18c63a8057bfcb0b8f68536812cb7edb8bdd8'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
