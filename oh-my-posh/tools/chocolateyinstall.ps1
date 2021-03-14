$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.111.2/install.exe'
  Checksum64 = 'eb39c7996222e6f8c37b1aa484d579a5fbfc1796d79360d42fc874457f1cba82c87774de5b6e63fd0e43ed24c6a905877ae621600a36f18bb7df32cd06bc61ad'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
