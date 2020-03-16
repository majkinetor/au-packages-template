$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = "MSIFASTINSTALL=1 DISABLEROLLBACK=1 /qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  url                    = 'https://github.com/DavidMoore/ipfilter/releases/download/3.0.2.9-beta/IPFilter.msi'
  checksum               = '16c673b7fb64ff8dee9fd066a0a0fcd7cc97a66573b9f981ef6c3901783f5043'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
