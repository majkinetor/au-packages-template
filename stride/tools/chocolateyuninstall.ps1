$ErrorActionPreference = 'Stop';
$GlobalCache = "$env:HomePath\.nuget\packages";
if($env:NUGET_HTTP_CACHE_PATH) {$GlobalCache = $env:NUGET_HTTP_CACHE_PATH}
$Version = '3.1.0.1'
Write-Host 'Checking to make sure that stride.GameStudio is closed before uninstalling'
if($Null -ne (Get-Process "stride.GameStudio" -ea SilentlyContinue) -or $Null -ne (Get-Process "stride.ConnectionRouter" -ea SilentlyContinue)){ 
    throw "stride still in use. if GameStudio is closed and you are still receiving this error, run 'Stop-Process -Name stride.ConnectionRouter'."
}

if(Test-Path "$GlobalCache\stride\$Version\"){
    Write-Host (Test-Path "$GlobalCache\stride\$Version\")
Remove-Item "$GlobalCache\stride\$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\stride.GameStudio\$Version\"){
Remove-Item "$GlobalCache\stride.GameStudio\$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\stride.$Version\"){
Remove-Item "$GlobalCache\stride.$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\stride.GameStudio.$Version\"){
Remove-Item "$GlobalCache\stride.GameStudio.$Version\" -Force -Recurse
}