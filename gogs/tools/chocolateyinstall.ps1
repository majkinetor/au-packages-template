$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/gogs/gogs/releases/download/v0.11.53/windows_386.zip'
  url64bit               = 'https://github.com/gogs/gogs/releases/download/v0.11.53/windows_amd64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'c59fb7af4bf4ddb298c415ed999a337edd53bd2b115940cdb05dd1629434841b'
  checksum64             = 'cc1e43ffa4a8fc37ec695adb2cccd75c84a3901088b9995f5516d06f5e7e811c'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
