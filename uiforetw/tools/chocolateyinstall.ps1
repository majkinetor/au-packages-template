$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/1.54/etwpackage1.54.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'a05cdf27128635daabc24b5d16853275d157dbddd9339d0b010e082483212144'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
