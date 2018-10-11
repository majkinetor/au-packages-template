$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'msi'
  SilentArgs             = '/qn /norestart'
  url                    = 'https://download.microsoft.com/download/D/3/3/D331B37A-CBFA-4FC2-82D5-4953AB06B188/ADMXMigrator.msi'
  checksum               = 'b5de85b742a1a23db6da37fc4f399b464c2b4585302ae65c555c8910c2a8de6b'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
