# Stop Iguana service if it exists and is running
Get-Service Iguana -ErrorAction SilentlyContinue | Stop-Service