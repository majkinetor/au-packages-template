$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.116.2/install.exe'
  Checksum64 = '7a6508a4ea34fcf424107b5588d648216d49d0b31edc92f265b06d1a2e9e67a270078da6b104d451fdc356b2eacf87f78cb3b39ea2c4f751e241b0411a751c46'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
