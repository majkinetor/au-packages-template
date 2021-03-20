$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.117.1/install.exe'
  Checksum64 = '8cda2ee1c516496636042260486a78d935c6abe5ef57de7aa6f6b7e417de02198cb7ab431db39d4cd13746d1bc917ad1b9dd76682643b98530624e68d25f5a94'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
