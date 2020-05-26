$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar.gz')
    Url = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.9/buffalo_0.16.9_windows_i386.tar.gz'
    Url64bit = 'https://github.com/gobuffalo/buffalo/releases/download/v0.16.9/buffalo_0.16.9_windows_x86_64.tar.gz'
    CheckSum = '72091682cf3c06f01049131cdea1961d4ab42601f1037011c06723189b93461568dd47bbc23e175162c1dbb3d22a5959eae04f27120041cb3430e2f3ceff02b2'
    Checksum64 = 'd2ac9258fba6c9a60687eccde0b63e6cb6f9ba477766767deb42875e4ff6c2a43ebc0771152d4a04df4b12bbc842c2425a469cfa5d47277f08efcb513cee1b34'
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
  
  
