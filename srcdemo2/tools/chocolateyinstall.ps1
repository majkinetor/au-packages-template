$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/srcdemo2/SrcDemo2-setup-2012-04-07.exe'
  checksum               = 'd6a081046f3b2672f03ed4c94850179faff9f0dd725916ddc0c7746dadf4b339'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
