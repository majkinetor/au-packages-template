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
  checksum               = 'caea2ae864d56e2d0a6a938a57a682fddbbe52d63e53fd49cb01338bfc669a23'
  checksumType           = 'sha256'
  Options                = $options
}
Install-ChocolateyPackage @packageArgs
