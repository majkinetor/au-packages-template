$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.86/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.86/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '95f959c31447c113fe12628f436429ba82199bfb577f522159cbc22dac20b80d'
  checksum64             = 'd34b4e220e144590008781b1afa6f5a0c7468ecbdd47ad8ae497dcc01117151b'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
