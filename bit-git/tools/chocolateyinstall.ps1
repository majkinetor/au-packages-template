$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v0.9.11/bit_0.9.11_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v0.9.11/bit_0.9.11_windows_amd64.tar.gz'
    CheckSum = '5b2c0ea67ef529a7ca381872b5bce5a3b1ed6c4683a5ee2c308c1e91d05fd4b3aa903f0ff48d3873c4beebd2ba17480a1f06a4c5afb59accaac01b4ff4da28df'
    Checksum64 = '8f1089b073bc8c5086ac532a3beba11f1deeaa8552ebe96776b9f7d27e1545b451d977ca81e6212007b3b55ca23468d13c90ce29dd6d28aeca0198b9e9be4d7c'
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
  
  
