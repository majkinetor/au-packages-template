$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/srcdemo2/SrcDemo2-setup-2011-09-29.exe'
  checksum               = 'adc943587d8dedb547ff3a606b62fd8f6d870d24dbc034e020a742b60623bb35'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
