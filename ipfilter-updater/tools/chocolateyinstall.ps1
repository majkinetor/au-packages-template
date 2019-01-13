$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://davidmoore.github.io/ipfilter/install/IPFilter.msi'
  checksum               = 'f048f18e2263e9ae909e7c8ab7a36e6bc19eeb0cc4aa9ec344606f7b86b5728a'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
