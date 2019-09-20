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
  checksum               = '67584655bcda50a6ce4fd2c0038b83d2f45515f24ae8ea65491d348d465b5599'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
