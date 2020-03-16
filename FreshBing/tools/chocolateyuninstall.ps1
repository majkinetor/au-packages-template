$ErrorActionPreference = 'Stop'; # stop on all errors

Get-ScheduledTask -TaskName "FreshBing" -ErrorAction Ignore | Unregister-ScheduledTask -Confirm:$false