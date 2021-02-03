$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v0.9.12/bit_0.9.12_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v0.9.12/bit_0.9.12_windows_amd64.tar.gz'
    CheckSum = '7786d48f9eae600ded454ca8f768ef2a7805f7875861ca7d9b71e9039b8dc1dd75e3a7acf4d8fa5f305026a7144fc704a162673600c5d33cf541f3913516dbf1'
    Checksum64 = 'f95461c722ed5568914392c29ca7329aa16f30d5e6abba60e84b3dd716fb1cd83374a5e1ac8972b59f9aa0614e8b537f4895227106961fc7fc0ea8ca340bac63'
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
  
  
