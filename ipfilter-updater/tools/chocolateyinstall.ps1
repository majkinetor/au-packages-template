$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://github.com/DavidMoore/ipfilter/releases/download/3.0.2.4-beta/IPFilter.msi'
  checksum               = '04912bbd35d80fc3bfec34ed03350f13ac163940ee121dca377b6ea1f856d62c'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
