$ErrorActionPreference = 'Stop';

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/authpass/authpass/releases/download/v1.7.11/AuthPass-setup-1.7.11_1657.exe'
  Checksum64 = 'e910851b3092e82c41718f8a5f3376c19284fc88349b87038b4390b5f8d6c7501a71c14402ffa27953a2aaccc07019e74c3639098ec8036b3eaeb3ea74cdd8d5'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
