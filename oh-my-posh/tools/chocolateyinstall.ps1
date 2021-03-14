$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.112.1/install.exe'
  Checksum64 = '34f1d186259bdf99a8b9c2496a4cd09616293b19142618f1a06e2e675450aee68af19a0f8372ddb46af42cd87a16684b7e7f65c26c57d1b263d941f39d4ce7fe'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
