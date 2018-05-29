# Stop any JetBrains ETW provider services
Get-Service | Where-Object { $_.Name -like "JetBrainsETW*" } | Stop-Service