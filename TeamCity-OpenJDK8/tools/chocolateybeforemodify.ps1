if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\ChocolateyHelpers.ps1"

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