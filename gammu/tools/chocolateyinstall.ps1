$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.41.0-Windows.exe'
  url64bit               = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.41.0-Windows-64bit.exe'
  checksum               = '86ae9baf69409891792ed4023ebc1246b42ccd9f40d102fba51c505bb78f5d88'
  checksum64             = '231d86b7c6b68e271243c8939433fd848ce2368750706734564f78821d106210'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
