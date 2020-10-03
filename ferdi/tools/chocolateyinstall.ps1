$ErrorActionPreference = 'Stop';

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/S'
  Url64bit = 'https://github.com/getferdi/ferdi/releases/download/v5.5.0/Ferdi-Setup-5.5.0.exe'
  Checksum64 = '3c7ca5709122056f19d824d9e3f7ee3ac890f423d7d260cf4e343f7e397473c661abfdb788fb0661c49013cf575d9b77ea672aad6841f47c53ab0472084d2fe9'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
