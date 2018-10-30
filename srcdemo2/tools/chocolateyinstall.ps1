$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/srcdemo2/SrcDemo2-setup-2012-03-31.exe'
  checksum               = '241877096af2be271a70328dc58fa7aeb483c07d25c2b9fd446c155bbd47879f'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
