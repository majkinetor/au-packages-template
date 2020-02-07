$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'buffalo.tar.gz')
    Url = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.5/buffalo_0.15.5_windows_i386.tar.gz'
    Url64bit = 'https://github.com/gobuffalo/buffalo/releases/download/v0.15.5/buffalo_0.15.5_windows_x86_64.tar.gz'
    CheckSum = 'b7295b144857c0a76abcd04aff0bd893e0b72f146bb5389341f8fd8d4dd53b23496fcaeb93c35e90927b8e51297eee67d79d8d64d8c57eefab44873f21b02a5f'
    Checksum64 = 'c0b1fb760469f192ae3e8fbccda0b66f2f5649203d60a22ff2477b9d9e7e40b0af1ba614d6b6bd9b097473801b2521194c6e5cd02fb855189d7ba1a7079d5a3b'
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
  
  
