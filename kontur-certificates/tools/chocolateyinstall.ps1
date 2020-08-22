$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '5a59dfa62fb42bb47c46e1c6b9e65916a57e0a2e7d256d91cf4dd787b6cdfa5f'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
