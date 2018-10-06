$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'https://www.donationcoder.com/Software/Mouser/clipboardhelpandspell/downloads/ClipboardHelpAndSpellSetup.exe'

  softwareName  = 'Clipboard Help+Spell*'

  checksum      = '7e4ea4dbb31f05e1397672d0914b663a2d69ffe5d8e210a3f4128804baf0be69'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
