$ErrorActionPreference = 'Stop';

Remove-Item -Path (Join-Path (Join-Path (Join-Path (Get-ToolsLocation) "milkman") "plugins") "$env:ChocolateyPackageName.jar") -Force