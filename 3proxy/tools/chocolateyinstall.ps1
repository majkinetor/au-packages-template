$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.11/3proxy-0.8.11.zip'
  url64bit               = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.11/3proxy-0.8.11-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2c83da8290afd11313ee22709d6e0c68656b2ac87e421e7ca7e5204fd00b44ac'
  checksum64             = '9310ba8233ce77d31f27878d11509f1b613edfedbfef735e2cb76c0619705fb4'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
