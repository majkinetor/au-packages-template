$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://www.gnivc.ru/html/Soft/pdf417/pdf417_3_2_4.rar'
  checksum               = 'a351acc3fc5639b8593109dd4b0bef50d70dc6d5e67213f8ed0c9dc982264f62'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  File                   = "$env:TMP\Печать НД с PDF417(3.2.4).msi"
}
Install-ChocolateyInstallPackage @packageArgs
