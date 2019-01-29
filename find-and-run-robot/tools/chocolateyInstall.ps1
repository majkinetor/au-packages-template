$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'https://www.donationcoder.com/Software/Mouser/findrun/downloads/FindAndRunRobotSetup.exe'

  softwareName  = 'Find+Run Robot*'

  checksum      = '9381ffe35b4ca5fd007cd626c24d0a851c1133cfd97b537932f48c2ab0e00131'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
