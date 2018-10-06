$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/v1.50/etwpackage1.50.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '6b15249203d94bc8c30f18e8dcdc521358f4f0a886bab040172027a332097e6e'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
