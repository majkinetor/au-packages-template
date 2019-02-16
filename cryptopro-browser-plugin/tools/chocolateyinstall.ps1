$options =
@{
  Headers = @{
    'User-Agent' = 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36';
  }
}

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '-silent -norestart'
  url                    = 'https://www.cryptopro.ru/products/cades/plugin/get_2_0'
  checksum               = 'fad84d4687773b24aba4861fe734f25f56e03e7dd62729ce16dc3e9b3dc13299'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
