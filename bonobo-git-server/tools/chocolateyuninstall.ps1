$ErrorActionPreference = 'Stop';

Import-Module WebAdministration

if(Test-Path IIS:\AppPools\BonoboGitServer)
{
        #May not want to do this on every upgrade
        Write-Output "Removing Existing AppPool"
        Remove-WebAppPool BonoboGitServer
    Get-ChildItem IIS:\AppPools
}

if(Test-Path IIS:\Sites\BonoboGitServer)
{
    #May not want to do this on every upgrade
    Write-Output "Removing Existing Website"
    Remove-WebSite BonoboGitServer
    Get-ChildItem IIS:\Sites
}

Uninstall-ChocolateyZipPackage "BonoboGitServer"
Write-Output "Files and repositories have not been deleted and may need to be cleaned up manually."