$optionsFile = (Join-Path $PSScriptRoot 'options.xml')

if (!(Test-Path $optionsFile)) {
  throw 'Install options file missing. Could not uninstall.'
}

$options = Import-CliXml -Path $optionsFile

$service = Get-Service | Where-Object Name -eq $options['serviceName']
if ($service -ne $null) {
  Stop-Service $service
}

$binPath = Join-Path $options['unzipLocation'] 'TeamCity\bin'
if ((Test-Path $binPath) -and ($service -ne $null)) {
  Push-Location $binPath
  Start-ChocolateyProcessAsAdmin '.\teamcity-server.bat service delete'
  Pop-Location
}


Remove-Item (Join-Path $options['unzipLocation'] 'TeamCity') -Recurse -Force