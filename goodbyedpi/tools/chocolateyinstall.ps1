if (Get-OSArchitectureWidth -eq 64) {
$subfolder = '_64'
}
$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/ValdikSS/GoodbyeDPI/releases/download/0.1.4/goodbyedpi-0.1.4.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '0c834614e884b5840f6d2c52ed2815ef9544cfe305e30da8c3f9c9fad7d59315'
  checksumType           = 'sha256'
  SpecificFolder         = "goodbyedpi-0.1.4/x86$subfolder"
}
Install-ChocolateyZipPackage @packageArgs
