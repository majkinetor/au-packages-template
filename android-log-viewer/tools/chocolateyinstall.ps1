$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/MarkusPalcer/AndroidLogViewer/releases/download/v1.2.2/Android.Log.Viewer.msi'
$checksum32 = '784feaeeb418b06ed28bc5ee24daf220afb1c99830011ba70a28d435a33a5f8bb8fedcec46c3862d9a6eb9365c8b933ef4f885f3a6ebba8540a7349d4bea3e42'
$checksumType32 = 'sha512'
Install-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'msi' -SilentArgs '/q' -Url $url32 -Checksum $checksum32 -ChecksumType $checksumType32
  # [-Url64bit <String>] `
  # [-ValidExitCodes <Object>] `
  # [-Options <Hashtable>] `
  # [-File <String>] `
  # [-File64 <String>] `
  # [-UseOnlyPackageSilentArguments] `
  # [-UseOriginalLocation] `
  # [-IgnoredArguments <Object[]>] [<CommonParameters>]<#  #>
