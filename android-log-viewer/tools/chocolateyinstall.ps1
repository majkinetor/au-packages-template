$ErrorActionPreference = 'Stop';

$InstallArgs = @{
  PackageName = $env:ChocolateyPackageName
  FileType = 'msi'
  SilentArgs = '/q'
  Url = 'https://github.com/MarkusPalcer/AndroidLogViewer/releases/download/v1.2.2/Android.Log.Viewer.msi'
  Checksum = '784feaeeb418b06ed28bc5ee24daf220afb1c99830011ba70a28d435a33a5f8bb8fedcec46c3862d9a6eb9365c8b933ef4f885f3a6ebba8540a7349d4bea3e42'
  ChecksumType = 'sha512'
}

Install-ChocolateyPackage @InstallArgs
