$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://www.leoniv.diod.club/articles/ft232rl/downloads/ftester.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '59101a2f568454089382146f21f8c9c588423b20b800eeaab34b0cfc46a3619c'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
