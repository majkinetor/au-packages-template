$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.39.0-Windows.exe'
  url64bit               = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.39.0-Windows-64bit.exe'
  checksum               = '1f7864030864c03599fffff05c93a08465b31a63211905b06e9ee66d8e735c6d'
  checksum64             = '92fac61147292ca33fef5e70466c9c5860a8020ba96e8ad787eabcfda182876d'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
