$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.110.0/install.exe'
  Checksum64 = '3f6acef24d7f896a032a7ef311ec91399e76d6e58bf67486397957eae2e0bd2ebe29c5766b19973147ab5fc0caa67870a56883ee70636db48e336cabc9a7dcfc'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
