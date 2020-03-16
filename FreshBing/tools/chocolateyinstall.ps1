$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$action = New-ScheduledTaskAction -Execute 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -Argument "-NoProfile -WindowStyle Hidden -ExecutionPolicy unrestricted -File ""$($toolsDir)\FreshBing.ps1"" "

$trigger1 = New-ScheduledTaskTrigger -Daily -At 9am
$trigger2 = New-ScheduledTaskTrigger -AtLogOn

# Register scheduled task and run it immediately
Register-ScheduledTask -Action $action -Trigger $trigger1, $trigger2 -TaskName "FreshBing" -Description "Daily Bing desktop wallpaper" | Start-ScheduledTask
