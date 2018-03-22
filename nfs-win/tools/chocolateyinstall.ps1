$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://github.com/billziss-gh/nfs-win/releases/download/v1.0.17083/nfs-win-1.0.17083.msi'
  checksum               = '0d40ced8bcefdc1f52e6d36bbb430b415212ed60ed007f9b1280e619a9da387b'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
