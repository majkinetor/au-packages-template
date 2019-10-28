$ErrorActionPreference = 'Stop';

Import-Module WebAdministration

if(Test-Path IIS:\AppPools\BonoboGitServer)
{
    Write-Output "Removing AppPool: Bonobo.Git.Server"
    Remove-WebAppPool BonoboGitServer
    Get-ChildItem IIS:\AppPools
}
else {
    Write-Output "Default AppPool (Bonobo.Git.Server) was not found. You may need to manually remove the AppPool if it is no longer in use."
}

if(Test-Path IIS:\Sites\BonoboGitServer)
{
    Write-Output "Removing Website: Bonobo.Git.Server"
    Remove-WebSite Bonobo.Git.Server
    Get-ChildItem IIS:\Sites
}
else {
    Write-Output "Default Website (Bonobo.Git.Server) was not found. You may need to manually remove the Website."
}

Uninstall-ChocolateyZipPackage -PackageName $env:ChocolateyPackageName
Write-Output "Files and repositories have not been deleted and may need to be cleaned up manually."
Write-Output "Optional Windows Features required for Bonobo have not been uninstalled (Use caution when removing them manually as they may be in use by other applications)."