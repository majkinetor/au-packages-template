$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.microsoft.com/download/C/4/F/C4F908C9-98ED-4E5F-88D5-7D6A5004AEBD/SQLServer2017-KB4535007-x64.exe'
$checksum   = 'e0cb8c5420e9e7cfd4b3b4e37126ff54ecf1a1bbc3c1b4b75362315c965ab368'
$softwareName = 'Hotfix 3281 for SQL Server 2017*(KB4535007)*'

$filename = [IO.Path]::GetFileName($url)

# Download like Install-ChocolateyPackage (so we can restart from cached download)
$chocTempDir = $env:TEMP
$tempDir = Join-Path $chocTempDir "$($env:chocolateyPackageName)"
if ($env:chocolateyPackageVersion -ne $null) { $tempDir = Join-Path $tempDir "$($env:chocolateyPackageVersion)"; }
$tempDir = $tempDir -replace '\\chocolatey\\chocolatey\\', '\chocolatey\'
if (![System.IO.Directory]::Exists($tempDir)) { [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null }
$downloadFilePath = Join-Path $tempDir "$($packageName)Install.$fileType"

$fullFilePath = Join-Path $toolsDir $filename

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  FileFullPath  = $downloadFilePath
  checksum      = $checksum
  checksumType  = 'sha256'
}

$filePath = Get-ChocolateyWebFile @packageArgs

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
