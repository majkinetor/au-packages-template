$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.2.9.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '02b76d5d31ec98441c0aa4f6d8894816257ddca8ad21e51a4eeee7d399fd1c99'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
