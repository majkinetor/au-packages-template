$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName            = 'Pokémon Trading Card Game Online'
  fileType               = 'MSI'
  url                    = 'https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi'
  checksum               = 'dc8e65d3f15daac7c504dde3295a5c155f997ccfe73479c9d856ae936eac900d'
  checksumType           = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}
 
Install-ChocolateyPackage @packageArgs
