$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.111.1/install.exe'
  Checksum64 = '1329ab2c4e3336561510780af6da24d2d8f6cc9a6be36af14afbd2da150c4b72501855d824d4d220e8b35cd65086ea1933338baefa2ea833f98b68c4f1d98b3c'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
