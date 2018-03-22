$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://github.com/antiufo/Shaman.Dokan.Warc/releases/download/1.0.1/Shaman.Dokan.Warc.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = 'bf891b790a6a4600946d400fa51ab84db983c71284ae08e292a2139b1dee3192'
  checksumType           = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
