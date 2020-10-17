$ErrorActionPreference = 'Stop';

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/VERYSILENT'
  Url64bit = 'https://github.com/authpass/authpass/releases/download/v1.7.9/AuthPass-setup-1.7.9_1605.exe'
  Checksum64 = '999b86ebdf090c531e2744cad21c183ed5870d9c7ef98e44cf585cc054895254d08781a894b42aad09dd3f64e8418ebff3f8a69e02ec96a41f1d151e77ad8195'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
