$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v1.0.5/bit_1.0.5_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v1.0.5/bit_1.0.5_windows_amd64.tar.gz'
    CheckSum = '949724d2950ba3f6a4be8b6d8d0f0090e0c9537e40ecedf78ed9f8cf83a5ee4f91d549e69e08541461197aa35283b3473aa64a7f20d111923c38872758f3b7be'
    Checksum64 = 'fdb6f56d6f7bf1067355e5eb93f5b3a8cbac346310f63b3fc46498862f620b5758825b679be4b481290a183e6e60b7fbd1d01996baad63c4650b29e8a5b61ac8'
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
  
  
