$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.117.0/install.exe'
  Checksum64 = 'f24e7d42bdd79b9c8a7b2ca88d31437f242b5647a3a4cb3512b96684cd4dfe5ead5e81a91a9000f453957718a01dc45bf59fbbf8506b0136638747a7c354ce7c'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
