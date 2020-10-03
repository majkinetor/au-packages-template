$ErrorActionPreference = 'Stop';

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/authpass/authpass/releases/download/v1.7.8/AuthPass-setup-1.7.8_1552.exe'
  Checksum64 = 'd0285be9f807e30a778052fb7f6ad10870fc537f10844b90020fd7cc90a059dd7aa54f02cd867ca585a1a1af56c408edc75d7a0080ba95b28248fc809775e358'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
