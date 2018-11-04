$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.gnivc.ru/html/Soft/pdf417/pdf417(3.0.32).zip'
  checksum               = 'b27605719ce86a532d9a9d190b5890658238e9e511c01dc2a6576edd0816b288'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  File                   = "$env:TMP\ÅÑτáΓ∞ ìä ß PDF417(3.0.32).msi"
}
Install-ChocolateyInstallPackage @packageArgs
