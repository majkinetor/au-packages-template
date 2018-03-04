$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/s /sp"/s /v"/qn /norestart""'
  url                    = 'https://its.1c.ru/db/files/1CITS/EXE/TradeWare/1C/ScanOPOS/ScanOPOS.exe'
  checksum               = '80170acc844e4ceb55c839881988b54f36fac4ff5a319b1c02fcee5a870b40ef'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
