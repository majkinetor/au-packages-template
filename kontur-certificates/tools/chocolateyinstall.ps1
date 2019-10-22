$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/nowait'
  url                    = 'https://help.kontur.ru/content/components/Certificates_Kontur_Admin.exe'
  checksum               = '5877f7d2ace542585cb433a827af1392544afffad86735a082dc99cde566fdac'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
