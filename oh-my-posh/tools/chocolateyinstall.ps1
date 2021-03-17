$ErrorActionPreference = 'Stop';

$InstallArgs = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v3.115.0/install.exe'
  Checksum64 = '96c473dfe8de736eb48dc8380c8fd378e452593aca7344d39fdf129ba95ea301db170fec74920cf6713bdeccb03df6ef84893b3c6a05280807f35bc299b61cee'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @InstallArgs
