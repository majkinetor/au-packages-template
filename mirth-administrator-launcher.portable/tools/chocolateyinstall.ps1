$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#Based on NO DETECTION IN PRO
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'zip'
  
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://s3.amazonaws.com/downloads.mirthcorp.com/connect-client-launcher/mirth-administrator-launcher-1.1.0-windows.zip"  #download URL, HTTPS preferrred
  checksum      = '0CC7C85C46AD0D73659A8F759824825DE4FAF62C60A04957410937568AE609EE'
  checksumType  = 'sha256'
  url64bit      = "https://s3.amazonaws.com/downloads.mirthcorp.com/connect-client-launcher/mirth-administrator-launcher-1.1.0-windows-x64.zip"   # 64bit URL here (HTTPS preferred) or remove - if installer contains both architectures (very rare), use $url
  checksum64    = 'AD24DBE341E77229C7F644378992FB2D33FE48A760730DEBDB6914DEB2977D04'
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyZipPackage @packageArgs

$files = get-childitem $toolsDir -include *.exe -recurse

foreach ($file in $files) {
  if (!($file.Name -eq "launcher.exe")) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
  }
}