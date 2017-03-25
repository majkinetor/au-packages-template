
$ErrorActionPreference = 'Continue';

$packageName= 'fonts-ricty-diminished'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$fonts =  Join-Path $toolsDir "fonts"

Get-ChildItem $fonts |
  ForEach-Object {powershell -f """$(Split-Path -parent $MyInvocation.MyCommand.Definition)\Remove-Font.ps1"""  ([System.IO.Path]::GetFileName($_))}

Write-ChocolateySuccess "$packageName"
