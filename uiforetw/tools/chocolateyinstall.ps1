$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/google/UIforETW/releases/download/v1.52/etwpackage1.52.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '17a4f2a94e005338b5cb61797cba53b4eb0ae01b36686c7ceb4b40f4f976c7ca'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
