$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  url                    = 'http://ftp.lissi.ru/LISSI-CSP/win10/LISSI-CSP-Setup-win32.exe'
  url64                  = 'http://ftp.lissi.ru/LISSI-CSP/win10/LISSI-CSP-Setup-x64.exe'
  checksum               = '1a73149af4d7770152e9c6fdb17e5a7f987e29a6118f8a8a72b23409400682e4'
  checksum64             = '27608acdf290e24a151802f6118ad8878187df65460eec01defb8df7127d36e1'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
