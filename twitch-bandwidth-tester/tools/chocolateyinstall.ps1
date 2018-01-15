$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://r-1.ch/TwitchTest.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2d105b4cb20f6acc3cf3bf5134dc24eddeb9f99e114ec1c8bfe714182b56e435'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
