$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/qn'
  url                    = 'https://trusted.ru/filedownload.php?file=492'
  checksum               = '55e7033802afa45fe1c675c0dc81de9f6382b678fd876cc091840b9ca67fa083'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
