$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    fileType       = 'exe'
    url            = 'https://camwebapp.com/download/cam'

    softwareName   = 'CAM'

    checksum       = 'a99e2cce176d3e378725bfb06b74d16364974602f6f75eef4a25309b90cc0c2d'
    checksumType   = 'sha256'

    silentArgs     = "/exelang 1033 /quiet"
    validExitCodes = @(0)
}
if ((Get-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" -ErrorAction SilentlyContinue).Release -ge 393295) {
    Install-ChocolateyPackage @packageArgs
}
else {
  Write-Host "Please reboot the system if .NET 4.6 or greater was just installed before installing this package." -BackgroundColor Black -ForegroundColor Red
  throw
}
