$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.43/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.43/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '7b6cb9d5231303208e087045d587becdabcbacd5b4b987e9462a344027c3ee6c'
  checksum64             = 'b3724d50d8512d0d445c4f2311609fbff146b04cae1db302d0ca0e855a6a081f'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
