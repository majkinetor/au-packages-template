$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.microsoft.com/download/C/4/F/C4F908C9-98ED-4E5F-88D5-7D6A5004AEBD/SQLServer2017-KB4052987-x64.exe'
$checksum   = '3228E428B10C884F6C3C91EEA8A65546AD7A019EE9B56D1E5CC31708611D24CE'

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
  softwareName  = 'sql-server-2017-cumulative-update*'
  silentArgs    = "/q /IAcceptSQLServerLicenseTerms /Action=Patch /AllInstances"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  # generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}