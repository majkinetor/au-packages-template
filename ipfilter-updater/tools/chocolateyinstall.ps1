$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://github.com/DavidMoore/ipfilter/releases/download/3.0.0-beta1/IPFilter.msi'
  checksum               = '0d1fa0283877328f63b916553aeaa3f6f506f39e22f8ec40f7d13bd31e146c33'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
