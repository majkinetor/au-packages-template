$processName = 'YACReader*'
$process = Get-Process -Name $processName

if ($process) {
  Write-Host "Stopping YACReader processes..."
  Stop-Process -InputObject $process
  Start-Sleep -Seconds 3
  
  $process = Get-Process -Name $processName
  
  if ($process) {
    Write-Warning "One or more YACReader processes failed to close. `nKilling YACReader processes..."
    Stop-Process -InputObject $process -Force
  }
  Write-Warning "YACReader will not be started after upgrading..."
}
