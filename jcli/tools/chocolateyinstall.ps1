$ErrorActionPreference = 'Stop';

$UnzipLocation = Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)

$ChocoWebFileArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileFullPath = (Join-Path $UnzipLocation 'jcli.tar.gz')
    Url = ''
    CheckSum = ''
    CheckSumType = ''
}
$file = Get-ChocolateyWebFile @ChocoWebFileArgs

  & 7z x $file -aoa -o"jcli.tar"
  $tarball = Get-ChildItem -Path 'jcli.tar'
  & 7z x "jcli.tar\$tarball" -aoa -ttar -o"jcli"
  Copy-Item -Path 'jcli\jcli.exe' -Destination "$UnzipLocation\jcli.exe"
