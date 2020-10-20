$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'smmdb-client-windows.tar.gz')
    Url = 'https://github.com/Tarnadas/smmdb-client/releases/download/0.3.0/smmdb-client-windows.tar.gz'
    CheckSum = '6d77661abcaec4d8b44a3f2c578172c5421e7ffe9e8d7f03005c96cc09caa6eed4d28622934b02f9976ece6fcb7f829cf7d890a79f27fbc1a6d631bc8ba3b542'
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
  
  
