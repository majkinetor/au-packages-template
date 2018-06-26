$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Microsoft VSTS CLI*'
  fileType      = 'msi'
  silentArgs    = "/qn /norestart"
  validExitCodes= @(0, 3010, 1641)
  url           = "https://vstscli.blob.core.windows.net/msi/vsts-cli-0.1.1.msi"
  checksum      = 'CA03F2178A84C8ABDD99E693FFCBE85BC3E0733A41AB831CA5736FD1894A724F'
  checksumType  = 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 