$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.6.8.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'ac0d94e23bcccd28972ed02e8ac4e819927c957e4c77f86cd098af689ea303f4'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
