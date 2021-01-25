$ErrorActionPreference = 'Stop';

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'EXE'
  SilentArgs = '/SD'
  Url64bit = 'https://github.com/Syncplay/syncplay/releases/download/v1.6.7/Syncplay-1.6.7-Setup.exe'
  Checksum64 = '3c63ae181acc7629085b7e8d01d368322f5a19959ceb92cc2c00153be010514664cbac8c28021a1927deda0a8b9b0383f2f9a533c39c4ac5438dc1957c5920d3'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
