$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
    Url = 'https://github.com/Tarnadas/smmdb-client/releases/download/0.3.1/smmdb-client-windows.tar.gz'
    CheckSum = '541ae56f3a15b2cf683ae39f71a3b6b12a8b6c94f4abed3dec4f310768e7f29a1a78663dd2255e48a5fa098d320b68a16f1b033ae33686f49ab2a595ad0e8527'
    CheckSumType = 'sha512'
}

Get-ChocolateyWebFile @ChocoWebFileArgs
 
$UnGzArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnGzArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
  Remove-Item -Path (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz.txt')
  
  
  $UnTarArgs = @{
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar')
    PackageName = $env:ChocolateyPackageName
    Destination = $UnzipLocation
  }
  
  Get-ChocolateyUnzip @UnTarArgs
  
  Remove-Item -Path (Join-Path $UnzipLocation 'smmdb-client-windows.tar')
  Remove-Item -Path (Join-Path $UnzipLocation 'smmdb-client-windows.tar.txt')

  "Run `smmdb` to start"
  
  
