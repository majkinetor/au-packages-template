$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'http://downloads.softerra.com/ldapadmin/ldapbrowser-4.5.13724.0-x64-eng.msi'
$url64 = 'http://softerra-downloads.com/ldapadmin/ldapbrowser-4.5.13724.0-x64-eng.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Softerra LDAP Browser*'

  checksum      = '705296402ffbd0cc0593d95cc49fc33ceeb96ab0'
  checksumType  = 'sha1'
  checksum64    = 'fdebc2f7fafcab65d5e86052667026be64158024'
  checksumType64= 'sha1'

  silentArgs = '/quiet /norestart'  
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs