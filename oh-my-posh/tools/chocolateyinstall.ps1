$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.114.0/install.exe'
  Checksum64 = 'ea4a8c7fef53ce0a1f1a477e5dfd57adef954f5633e36c9056d4ab4ab82232ed26c23d10323ad9ec954341b5bc12dcf4c4ca6886e72856f491b1d945de513e90'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
