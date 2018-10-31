$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://downloads.sourceforge.net/project/grub4dos/WINGRUB/WINGRUB%200.02%20Build%206/WINGRB0206.EXE'
  checksum               = '80b1691c5bbbab40732bd34cd706ec6dbb73685eaa17236951cbd752a8482651'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
