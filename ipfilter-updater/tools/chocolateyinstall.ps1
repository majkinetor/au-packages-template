$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://github.com/DavidMoore/ipfilter/releases/download/3.0.1.4-beta/IPFilter.msi'
  checksum               = '918654d8f42e7168efe68cbae0e08f495eaab5b0298d31e77d4685797cd60d6e'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
