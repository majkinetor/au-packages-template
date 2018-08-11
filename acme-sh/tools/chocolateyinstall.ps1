$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/Neilpang/acme.sh/archive/2.7.9.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bb975a3f943e579b559e584227966bb16b93bec2cf1dc46421906e859a34504a'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
