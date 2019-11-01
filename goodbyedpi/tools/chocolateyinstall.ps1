if (Get-OSArchitectureWidth -eq 64) {
$subfolder = '_64'
}
$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/ValdikSS/GoodbyeDPI/releases/download/0.1.6/goodbyedpi-0.1.6.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2b8124aad279860fb490447708357cfe695253f828400032779e6da93f6e0c95'
  checksumType           = 'sha256'
  SpecificFolder         = "goodbyedpi-0.1.4/x86$subfolder"
}
Install-ChocolateyZipPackage @packageArgs
