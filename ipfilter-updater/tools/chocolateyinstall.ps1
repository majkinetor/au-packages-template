$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://github.com/DavidMoore/ipfilter/releases/download/3.0.2.3-beta/IPFilter.msi'
  checksum               = '279e8a5cd2512ba71d56b649fd2c834e0a73a0e218152bed378b80ac31932fbc'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
