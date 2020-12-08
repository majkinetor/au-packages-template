$ErrorActionPreference = 'Stop';
$GlobalCache = "$env:HomePath\.nuget\packages";
if($env:NUGET_HTTP_CACHE_PATH) {$GlobalCache = $env:NUGET_HTTP_CACHE_PATH}
$Version = '4.0.0.1-beta04-1341'
nuget install stride -OutPutDirectory $GlobalCache -Version $Version -Framework net472 -NoCache -NonInteractive -PreRelease -Force
nuget install stride.GameStudio -OutPutDirectory $GlobalCache -Version $Version -Framework net472 -NoCache -NonInteractive -PreRelease -Force

if($Null -ne (Get-Process "stride" -ea SilentlyContinue)){ 
    Write-Host "Stride Launcher will need to be closed and reopened to launch the new version"
}
