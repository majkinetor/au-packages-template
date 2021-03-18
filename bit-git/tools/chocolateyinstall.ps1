$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'bit-git.tar.gz')
    Url = 'https://github.com/chriswalz/bit/releases/download/v1.0.4/bit_1.0.4_windows_386.tar.gz'
    Url64bit = 'https://github.com/chriswalz/bit/releases/download/v1.0.4/bit_1.0.4_windows_amd64.tar.gz'
    CheckSum = 'd8bfcced89113baae675b1872661b45fe754e03c432d13dd1f4af7e8e1da28ec32f1345d2cb163d82590e8eb8a2c9cd3f90ee3ba75549bf9e5566a2fa9201209'
    Checksum64 = '44f7912dc75e554211f7d7ac918a0d584a7195424d8164a9e1a32da66aa7ae5f27c95b6739fd135c5dcb5a27dcb0ca328aec09e9540bcf42d10999a729a958d9'
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
  
  
