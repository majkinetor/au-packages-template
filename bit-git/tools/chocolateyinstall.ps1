$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v1.0.3/bit_1.0.3_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v1.0.3/bit_1.0.3_windows_amd64.tar.gz'
    CheckSum = 'df11de6bd8bf05f7c7e8d164f4263b9b5ac7adc6ef55c6c78708b0a62736d51701329c063db66e3f2d9c6db45345336563e99e37fd3b5186373a14f974f9640b'
    Checksum64 = 'a1bd3d3fb8cb797b37e86b4564d66ba58238eec6a7d60957e4b1b5bed05bd52a811fd82e439ddb132251d92ad3ef10a95c0a7e334afe4d43b924ccd2cb764e6d'
    CheckSumType = 'sha512'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @ChocoWebFileArgs
 
$UnGzArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnGzArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'bit-git.tar.gz')
  Remove-Item -Path (Join-Path $UnzipLocation 'bit-git.tar.gz.txt')
  
  
  $UnTarArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnTarArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'bit-git.tar')
  Remove-Item -Path (Join-Path $UnzipLocation 'bit-git.tar.txt')
  
  
