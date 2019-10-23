$ErrorActionPreference = 'Stop';

$version = '0.2.1'
Install-Script -RequiredVersion $version -Name 'oh-my-posh' -Scope 'AllUsers' -AcceptLicense -AllowPrerelease -Force
if($PSVersionTable.PSVersion.Major -gt 5){
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}
Set-Prompt

if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
Add-Content $PROFILE `
"Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox"
