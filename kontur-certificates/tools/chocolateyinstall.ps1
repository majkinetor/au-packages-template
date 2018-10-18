$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '33d0c92c9095c7be95e94413caebeacf4f2867e170924aa3457bf06bc0572439'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
