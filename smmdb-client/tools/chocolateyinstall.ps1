$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
    Url = 'https://github.com/Tarnadas/smmdb-client/releases/download/0.2.2/smmdb-client-windows.tar.gz'
    CheckSum = '66310a25afafaef7f02c694a321dbc7fe5e94261c1452ed3fae9772e51583f153f601e5d1589f0954d4c0cd55916529fe4be23ed251ff5e816d49003b636c7b2'
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
  
  
