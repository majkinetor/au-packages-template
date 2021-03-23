$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.120.0/install.exe'
  Checksum64 = '9c3ab3e7f33b527c90340219863b4275a4270465dcb944d5deeffe1740eaad63d57fd7eb800d225fb94a496fdc7a6ff6dc56861fba530b60cda38ed4c158372d'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
