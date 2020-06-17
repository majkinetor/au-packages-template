$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName            = 'Pokémon Trading Card Game Online'
  fileType               = 'MSI'
  url                    = 'https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi'
  checksum               = '6ed73989f6d596842351f3da7712de9c0f59465046df9238403b5dbfd861ad39'
  checksumType           = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}
 
Install-ChocolateyPackage @packageArgs
