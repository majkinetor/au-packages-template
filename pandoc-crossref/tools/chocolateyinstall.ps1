$ErrorActionPreference = 'Stop';
$packageName = 'pandoc-crossref'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/lierdakil/pandoc-crossref/releases/download/v0.2.5.0/windows-ghc8-pandoc1-19.zip'
$packageArgs = @{
    packageName   = $packageName
    unzipLocation = $toolsDir
    url           = $url

    softwareName  = 'pandoc-crossref*'

    checksum      = '31810278f6a45836099a3a7d83eae797c19764e13442a6fa2802ae9a212adab3'
    checksumType  = 'sha256'

}
Install-ChocolateyZipPackage @packageArgs
