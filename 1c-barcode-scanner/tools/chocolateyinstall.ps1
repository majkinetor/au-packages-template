$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/s /sp"/s /v"/qn /norestart""'
  url                    = 'https://its.1c.ru/db/files/1CITS/EXE/TradeWare/1C/ScanOPOS/ScanOPOS.exe'
  checksum               = '11f98ee88669923a8d19e58e955b8b7268abb6b2977ff687a714462e68aeba34'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
