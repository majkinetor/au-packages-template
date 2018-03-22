$options =
@{
  Headers = @{
    'Referer' = 'https://install.kontur.ru/kekep/?XUACompatible=8';
  }
}

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://install.kontur.ru/content/components/KD/KonturDiag2_admin.exe'
  checksum               = '742dbac413762a03f437b5a883b6dccbcfa827d882f0675e8636c02e7a902f0d'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
