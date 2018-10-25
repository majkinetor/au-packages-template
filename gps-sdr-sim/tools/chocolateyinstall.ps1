$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/osqzss/gps-sdr-sim/releases/download/v1.0/gps-sdr-sim.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '4c60abcad9fb21a1400f4de2639a580007ed6a432eb517940cc151f58bc2ffee'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
