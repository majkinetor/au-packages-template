$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'https://www.donationcoder.com/Software/Mouser/clipboardhelpandspell/downloads/ClipboardHelpAndSpellSetup.exe'

  softwareName  = 'Clipboard Help+Spell*'

  checksum      = 'f221fd3187ba1ee6f7e7cd9c9c868df18be96870d775849969d53a92f7c0a002'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
