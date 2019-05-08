$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    fileType       = 'exe'
    url            = 'https://camwebapp.com/download/cam'

    softwareName   = 'CAM'

    checksum       = 'dc523a29c2f1341ef9f200a9f386f1e7fdad13b0618ea8482d4c9dd5ca8c4839'
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
