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
  checksum               = '8f8ceb762f2d331eae6a23314e40afe56643f2d40f9ded5e35ae5bc4b004cecd'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
