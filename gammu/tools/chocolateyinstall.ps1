$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  url                    = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.40.0-Windows.exe'
  url64bit               = 'https://dl.cihar.com/gammu/releases/windows/Gammu-1.40.0-Windows-64bit.exe'
  checksum               = '869e690bf1e1c243440000d4f4d851d730597b3170854f51fab1ee5edda55e20'
  checksum64             = '55f539a700a060726c79f9959f3b7bd0033b984a82a20e265b143c1c76eb9a47'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyPackage @packageArgs
