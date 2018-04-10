$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted.exe'
  checksum               = 'd7cfc178cf2e862eabcee9c2326ef52173d1094d5ddaa487d29336c65da71fd4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
