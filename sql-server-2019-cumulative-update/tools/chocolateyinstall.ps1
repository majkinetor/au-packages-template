$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.microsoft.com/download/6/e/7/6e72dddf-dfa4-4889-bc3d-e5d3a0fd11ce/SQLServer2019-KB4563110-x64.exe'
$checksum   = '398934eaac156f6e4784c23ddeee4e635585c7c29aedb5e2bef1e6f0b8422dc4'
$softwareName = 'Hotfix 4053 for SQL Server 2019*(KB4563110)*'

[bool] $runningAU = (Test-Path Function:\au_GetLatest)

. $toolsDir\Get-PendingReboot.ps1

if (([Version] (Get-CimInstance Win32_OperatingSystem).Version -lt [version] "10.0.0.0") -and -not $runningAU) {
  Write-Error "SQL Server 2019 requires a minimum of Windows 10 or Windows Server 2016"
}

$pp = Get-PackageParameters

if ( (!$pp['IGNOREPENDINGREBOOT']) -and (Get-PendingReboot).RebootPending) {
  Write-Error "A system reboot is pending. You must restart Windows first before installing SQL Server updates"
}

$filename = [IO.Path]::GetFileName($url)

# Download like Install-ChocolateyPackage (so we can restart from cached download)
$chocTempDir = $env:TEMP

$tempDir = Join-Path $chocTempDir "$($env:chocolateyPackageName)"
if ($env:chocolateyPackageVersion -ne $null) { $tempDir = Join-Path $tempDir "$($env:chocolateyPackageVersion)"; }
$tempDir = $tempDir -replace '\\chocolatey\\chocolatey\\', '\chocolatey\'
if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }
$downloadFilePath = Join-Path $tempDir $filename

$fullFilePath = Join-Path $toolsDir $filename

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  FileFullPath  = $downloadFilePath
  checksum      = $checksum
  checksumType  = 'sha256'
}

$filePath = Get-ChocolateyWebFile @packageArgs

if (Test-Path Function:\au_GetLatest) {
  exit
}

# Copy into tools to keep for uninstall
Copy-Item $filePath -Destination $fullFilePath

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file  = $fullFilePath
  softwareName  = $softwareName
  silentArgs    = "/q /IAcceptSQLServerLicenseTerms /Action=Patch /AllInstances"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  # generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}
