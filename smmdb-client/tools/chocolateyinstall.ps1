$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
    Url = 'https://github.com/Tarnadas/smmdb-client/releases/download/0.1.2/smmdb-client-windows.tar.gz'
    CheckSum = '282448ee0da7eaac0a6d04b43209a203c369d965adb9eb56a8f4b53c660d792746082ffb6f8f46f361d5d04e9c46eb196184d40382741b0827bfc08225856f4f'
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
  
  
