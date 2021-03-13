$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.111.0/install.exe'
  Checksum64 = '7bbeac4b0417f8987c84cefed700909caf4952c59533fb76b1256356e3c52122de957e5f8093923015260f7b0ea4f07ec855c8d90c2105ec34309b5064b51a69'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
