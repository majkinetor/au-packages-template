$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar.gz')
    Url = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.16/buffalo_0.16.16_windows_i386.tar.gz'
    Url64bit = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.16/buffalo_0.16.16_windows_x86_64.tar.gz'
    CheckSum = 'd22647a3e75c11dee5889d121c787c6a136cb74fee488a909808c454397e762dddb7a4364f71acea6945cd603bc6bc6e8fa0a5222c059682f121dd9d681ea507'
    Checksum64 = '700e99523b1eb943ec9188e868efbf4e0090807eda2ee7910d76a222b10b3afbc02ddbe2eac5b5b6e2d73671c4ea70cff5760b235a51f7c5d90b2f648357c736'
    CheckSumType = 'sha512'
    ChecksumType64 = 'sha512'
}

Get-ChocolateyWebFile @ChocoWebFileArgs
 
$UnGzArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar.gz')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnGzArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'buffalo.tar.gz')
  Remove-Item -Path (Join-Path $UnzipLocation 'buffalo.tar.gz.txt')
  
  
  $UnTarArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnTarArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'buffalo.tar')
  Remove-Item -Path (Join-Path $UnzipLocation 'buffalo.tar.txt')
  
  
