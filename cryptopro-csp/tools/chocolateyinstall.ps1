$options =
@{
  Headers = @{
    'Referer' = 'https://install.kontur.ru/kekep/?XUACompatible=8';
  }
}

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '-silent -args "/qn /norestart" -noreboot -nodlg'
  url                    = 'https://help.kontur.ru/content/components/CSP40R2Setup.exe'
  checksum               = 'e01fa4ca545c8a4002b9afe3243f80027b76ef5fb81fd5d9e9d1dcaddfaca54b'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
