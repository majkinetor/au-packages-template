$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url = 'http://downloads.softerra.com/ldapadmin/ldapbrowser-4.5.19808.0-x86-eng.msi'
$url64 = 'http://downloads.softerra.com/ldapadmin/ldapbrowser-4.5.19808.0-x64-eng.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Softerra LDAP Browser*'

  checksum      = 'ab5175ff06cd249a8c74a8b6e98f9f5482b2230f'
  checksumType  = 'sha1'
  checksum64    = '7c8094ed0a9da1112212820012943d127a3cdbb5'
  checksumType64= 'sha1'

  silentArgs = '/quiet /norestart'  
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs