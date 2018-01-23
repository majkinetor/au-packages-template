$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.microsoft.com/download/E/F/2/EF23C21D-7860-4F05-88CE-39AA114B014B/SQLServer2017-x64-ENU-Dev.iso'

$pp = Get-PackageParameters

# Default to use supplied configuration file and current user as sysadmin
if (!$pp['CONFIGURATIONFILE']) { 
  $pp['CONFIGURATIONFILE'] = "$toolsDir\ConfigurationFile.ini"
}

if (!$pp['SQLSYSADMINACCOUNTS']) { 
  $pp['SQLSYSADMINACCOUNTS'] = "$env:USERDOMAIN\$env:USERNAME" 
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Microsoft SQL Server 2017 (64-bit)'
  checksum      = '315D88E0211DB6B5087848A6D12ECD32FB530F8B58F185100502626EF2E32E74'
  checksumType  = 'sha256'

  silentArgs   = "/IAcceptSqlServerLicenseTerms /Q "
  validExitCodes= @(0, 3010)
}

# Download if we don't have an existing .iso
if (!$pp['IsoPath']) {

  $chocTempDir = $env:TEMP
  $tempDir = Join-Path $chocTempDir "$($env:chocolateyPackageName)"
  if ($env:chocolateyPackageVersion -ne $null) {
     $tempDir = Join-Path $tempDir "$($env:chocolateyPackageVersion)"; 
  }

  $tempDir = $tempDir -replace '\\chocolatey\\chocolatey\\', '\chocolatey\'
  if (![System.IO.Directory]::Exists($tempDir)) { 
    [System.IO.Directory]::CreateDirectory($tempDir) | Out-Null
  }

  $fileFullPath = Join-Path $tempDir "SQLServer2017-x64-ENU-Dev.iso"
  Get-ChocolateyWebFile @packageArgs -FileFullPath $fileFullPath
} else {
  $fileFullPath = $pp['IsoPath']
  $pp.Remove("IsoPath")
}

# append remaining package parameters
$packageArgs.silentArgs += ($pp.GetEnumerator() | ForEach-Object { "/$($_.name)=`"$($_.value)`"" }) -join " "

$MountResult = Mount-DiskImage -ImagePath $fileFullPath -StorageType ISO -PassThru
$MountVolume = $MountResult | Get-Volume
$MountLocation = "$($MountVolume.DriveLetter):"

Install-ChocolateyInstallPackage @packageArgs -File "$($MountLocation)\setup.exe"

Dismount-DiskImage -ImagePath $fileFullPath