$ErrorActionPreference = 'Stop';

$version = '2.0.311'
Install-Script -RequiredVersion $version -Name 'oh-my-posh' -Scope 'AllUsers' -Force
if($PSVersionTable.PSVersion.Major -gt 5){
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}
