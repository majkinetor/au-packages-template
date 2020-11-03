$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v0.9.10/bit_0.9.10_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v0.9.10/bit_0.9.10_windows_amd64.tar.gz'
    CheckSum = '867b6726d3409f20cc3883be0a8f807fa6aeca1ea7b9ee850f6e3edceebd1c176a83f216de721343f5ffde6230a1c37fe5ac31b901418971a6759bbf51a202e8'
    Checksum64 = 'c398a3d794158831a6b35d11f2a98d54169a347d264a08cc60b72c2cfa8d731b99a791f2aa60d4a0f3b83d4deb8caa917f139b3f9ea875c36526b577eb1aeb13'
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
  
  
