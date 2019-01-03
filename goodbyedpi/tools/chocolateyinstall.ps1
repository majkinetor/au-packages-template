if (Get-OSArchitectureWidth -eq 64) {
$subfolder = '_64'
}
$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/ValdikSS/GoodbyeDPI/releases/download/0.1.5/goodbyedpi-0.1.5.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '1e225ea392aebc2815bb5bec9a552a20d2feef6e6647e60d3b779deabeb65d55'
  checksumType           = 'sha256'
  SpecificFolder         = "goodbyedpi-0.1.4/x86$subfolder"
}
Install-ChocolateyZipPackage @packageArgs
