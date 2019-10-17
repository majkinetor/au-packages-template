$ErrorActionPreference = 'Stop';

$url32 = 'https://github.com/jgraph/drawio-desktop/releases/download/v12.1.0/draw.io-12.1.0-windows-installer.exe'
$checksum32 = 'c111d01c9a0dbfa25c96ce4b89d8b2b3799875a06bbb458fb78ed6908de379d44f8b2c75110a6410bcaba2006425b0f7f6d11ea47eda9546a01111a30669d4fb'
$checksumType32 = 'sha512'
Install-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/S' -Url $url32 -Checksum $checksum32 -ChecksumType $checksumType32
  # [-Url64bit <String>] `
  # [-ValidExitCodes <Object>] `
  # [-Options <Hashtable>] `
  # [-File <String>] `
  # [-File64 <String>] `
  # [-UseOnlyPackageSilentArguments] `
  # [-UseOriginalLocation] `
  # [-IgnoredArguments <Object[]>] [<CommonParameters>]<#  #>
