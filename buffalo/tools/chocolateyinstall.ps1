$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar.gz')
    Url = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.11/buffalo_0.16.11_windows_i386.tar.gz'
    Url64bit = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.11/buffalo_0.16.11_windows_x86_64.tar.gz'
    CheckSum = '33a5b22303ca6c960e6e816b5c63d0c2c74316d3cc1365b798c819368b6e6b2dcd151ed7da7745f8488dc8ab1a3e89b8f6bb7491432e5298fae6157f6d27ac8f'
    Checksum64 = 'd0652bba390a2d0883c46da432efd1f063450a357637e8a96ae600755640fc9b5762881d42159a135dcd5be15a6771785c3814602530399aa33a8ba94b1a0a60'
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
  
  
