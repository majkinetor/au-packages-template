$ErrorActionPreference = 'Stop';
$GlobalCache = "$env:HomePath\.nuget\packages";
if($env:NUGET_HTTP_CACHE_PATH) {$GlobalCache = $env:NUGET_HTTP_CACHE_PATH}
$Version = '3.1.0.1'
nuget install xenko -OutPutDirectory $GlobalCache -Version $Version -Framework net472 -NoCache -NonInteractive -PreRelease -Force
nuget install xenko.GameStudio -OutPutDirectory $GlobalCache -Version $Version -Framework net472 -NoCache -NonInteractive -PreRelease -Force

if($Null -ne (Get-Process "Xenko" -ea SilentlyContinue)){ 
    Write-Host "Xenko Launcher will need to be closed and reopened to launch the new version"
}