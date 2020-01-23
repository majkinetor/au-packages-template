$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)


$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'jcli.tar.gz')
    Url = 'https://github.com//jenkins-zh/jenkins-cli/releases/download/v0.0.25/jcli-windows-386.tar.gz'
    CheckSum = 'a11a7f8f10c63e78f2645af4294cf78218d892433af4bef1254fe3d042d64cc871df7a0f1bd3f5fa7af03a0948426882e769412368e9483c2415d4cc1c2d764e'
    CheckSumType = 'sha512'
}

Get-ChocolateyWebFile @ChocoWebFileArgs

$UnGzArgs = @{
  FileFullPath = (Join-Path $UnzipLocation 'jcli.tar.gz')
  PackageName = $env:ChocolateyPackageName
  Destination = $UnzipLocation
}

Get-ChocolateyUnzip @UnGzArgs

Remove-Item -Path (Join-Path $UnzipLocation 'jcli.tar.gz')
Remove-Item -Path (Join-Path $UnzipLocation 'jcli.tar.gz.txt')


$UnTarArgs = @{
  FileFullPath = (Join-Path $UnzipLocation 'jcli.tar')
  PackageName = $env:ChocolateyPackageName
  Destination = $UnzipLocation
}

Get-ChocolateyUnzip @UnTarArgs

Remove-Item -Path (Join-Path $UnzipLocation 'jcli.tar')
Remove-Item -Path (Join-Path $UnzipLocation 'jcli.tar.txt')

