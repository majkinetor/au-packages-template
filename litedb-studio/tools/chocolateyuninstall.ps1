$ErrorActionPreference = 'Stop';

Remove-Item -Path (Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName) -Force -Recurse