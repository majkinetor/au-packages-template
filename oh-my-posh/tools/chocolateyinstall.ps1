$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.113.0/install.exe'
  Checksum64 = '39c6293f13de7654bf6bfcd4f5d589278d2e9cdbdb02bc31faec9304b21c250f70567a5cb2fdf1225300004b4bffafb53c538af912d555b14d84d0ca92ae5219'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
