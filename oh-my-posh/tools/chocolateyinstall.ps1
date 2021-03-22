$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.118.0/install.exe'
  Checksum64 = '43acb00aa03a6ea815f61fedcb11c284cbe2dedcf01e6cc7a25ddf5da533f4a12ff3f9744f4636a71a66abd034c44bba63e4da954f0c23fcab7651b599232471'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
