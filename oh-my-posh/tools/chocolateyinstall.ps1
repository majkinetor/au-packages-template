$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.115.1/install.exe'
  Checksum64 = 'a2263463a6b3d5d6d65f6cb96bcd9b693e401a4c2a38f35fe57bb38e87ec4103dec2231d5c06139d7c7a588baa684a529a1dff61a6803532b94856b09ad60ba7'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
