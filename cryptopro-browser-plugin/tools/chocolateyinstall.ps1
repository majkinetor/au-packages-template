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
  checksum               = '5cab2be3fb9e63ec7b609f68c82aa85526c605b02d012ae15bd2cd95ec096a3a'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
