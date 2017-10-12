$ErrorActionPreference = 'Stop';

$packageName= 'SQL Server Management Studio'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fullUrl = 'https://download.microsoft.com/download/5/0/B/50B02ECB-CB5C-4C23-A1D3-DAB4467604DA/SSMS-Setup-ENU.exe'
$fullChecksum = 'E7EB0843299DA85BB294082D408F986191F2EE63F6D21813FDCEAA6019848E47'

$upgradeUrl = 'https://download.microsoft.com/download/5/0/B/50B02ECB-CB5C-4C23-A1D3-DAB4467604DA/SSMS-Setup-ENU-Upgrade.exe'
$upgradeChecksum = '68668E601B7D39EE55087CDF080CB0B340FEBF4F3BC4EC9D65EC4153F7B4CD60'

$release = '17.1'

# Check if 17.0 is installed so we can get upgrade package instead of full package
$ssms170 = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion | Where-Object { $_.DisplayName -eq "SQL Server Management Studio" -and $_.DisplayVersion -eq "14.0.17099.0" }

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = ''

  silentArgs    = "/quiet /install /norestart /log `"$env:TEMP\chocolatey\$($packageName)\$($packageName).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

  softwareName  = "SQL Server Management Studio - $release"
  checksum      = ''
  checksumType  = 'SHA256'
}

if ($ssms170) {
    Write-Warning "Existing install found, using upgrade installer"
    $packageArgs.url = $upgradeUrl
    $packageArgs.checksum = $upgradeChecksum
} else {
    $packageArgs.url = $fullUrl
    $packageargs.checksum = $fullChecksum
}

Install-ChocolateyPackage @packageArgs
