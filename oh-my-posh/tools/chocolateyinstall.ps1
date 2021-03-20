$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.117.2/install.exe'
  Checksum64 = '7c0e6a1b779b50e5052c593562c9cc51f922f0709adf2919c0b9ca7905aaef316c3b83c062762e2f6589d66309c31f5d6a315dc2b3f57d109daf190ff51455d3'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
