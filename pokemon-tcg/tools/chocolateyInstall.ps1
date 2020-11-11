$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName            = 'Pokémon Trading Card Game Online'
  fileType               = 'MSI'
  url                    = 'https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi'
  checksum               = '1ec91a2187a4a3f2197f1a06c5a9c3e99c896848e2ef58ea30a6278461111954'
  checksumType           = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}
 
Install-ChocolateyPackage @packageArgs
