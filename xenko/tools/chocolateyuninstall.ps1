$ErrorActionPreference = 'Stop';
$GlobalCache = "$env:HomePath\.nuget\packages";
if($env:NUGET_HTTP_CACHE_PATH) {$GlobalCache = $env:NUGET_HTTP_CACHE_PATH}
$Version = '3.1.0.1'
Write-Host 'Checking to make sure that Xenko.GameStudio is closed before uninstalling'
if($Null -ne (Get-Process "Xenko.GameStudio" -ea SilentlyContinue) -or $Null -ne (Get-Process "Xenko.ConnectionRouter" -ea SilentlyContinue)){ 
    throw "Xenko still in use. if GameStudio is closed and you are still receiving this error, run 'Stop-Process -Name Xenko.ConnectionRouter'."
}

if(Test-Path "$GlobalCache\Xenko\$Version\"){
    Write-Host (Test-Path "$GlobalCache\Xenko\$Version\")
Remove-Item "$GlobalCache\Xenko\$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\Xenko.GameStudio\$Version\"){
Remove-Item "$GlobalCache\Xenko.GameStudio\$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\Xenko.$Version\"){
Remove-Item "$GlobalCache\Xenko.$Version\" -Force -Recurse
}
if(Test-Path "$GlobalCache\Xenko.GameStudio.$Version\"){
Remove-Item "$GlobalCache\Xenko.GameStudio.$Version\" -Force -Recurse
}