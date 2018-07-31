$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/appveyor/secure-file/releases/download/1.0.0/secure-file.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '85fbbe94d0461d7e0283b3c69fddaa0a36e0ec7ab272b62f733c5c9eb9969f45'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
