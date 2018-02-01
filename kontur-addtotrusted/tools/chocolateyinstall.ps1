$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = ''
  url                    = 'https://help.kontur.ru/content/components/AddToTrusted.exe'
  checksum               = '744c185ad56e21145c739614a5824810121174185a4b3ab69da76f8b26107ca4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
