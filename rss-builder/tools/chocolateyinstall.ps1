$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#Based on MSI
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'RSS Builder*'
  fileType      = 'msi'
  silentArgs    = "/q"
  validExitCodes= @(0, 3010, 1641) 
  url           = "https://sourceforge.net/projects/rss-builder/files/rss-builder/Release_2_1_8/RSSBuilderSetup_2_1_8.msi/download?use_mirror=autoselect"
  checksum      = 'ABD31793C6E913E6554CCA241CF48A7BB884B98AD7B2A1B69833BA886CB985D3'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs

## See https://chocolatey.org/docs/helpers-reference

