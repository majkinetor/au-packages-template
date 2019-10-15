$ErrorActionPreference = 'Stop';

$pp = Get-PackageParameters
$url = 'https://bonobogitserver.com/resources/releases/6_5_0.zip'
$checksum32 = ''
if(!$pp['Site']) {$pp['Site'] = "Default Web Site"}
if(!$pp['Name']) {$pp['Name'] = "Bonobo.Git.Server"}
if(!$pp['InstallLocation']) {$pp['InstallLocation'] = "$env:SystemDrive\inetpub\wwwroot\Bonobo.Git.Server"}
if(!$pp['AppPool']){$pp['AppPool'] = "Bonobo.Git.Server"}
if(!$pp['UseExistingAppPool']){$pp['UseExistingAppPool'] = "False"}
$UseExistingAppPool = [System.Convert]::ToBoolean($pp['UseExistingAppPool'])

Install-ChocolateyZipPackage -PackageName "BonoboGitServer" -Url $url -UnzipLocation "$env:SystemDrive\inetpub\wwwroot\" -CheckSum $checksum

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole).State -eq "Disabled"){
    Write-Output "Installing IIS WebServerRole"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer).State -eq "Disabled"){
    Write-Output "Installing IIS WebServer"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment).State -eq "Disabled"){
    Write-Output "Installing IIS ApplicationDevelopment"
    Enable-WindowsOptionalFeature -Online -FeatureName  IIS-ApplicationDevelopment
}


if ((Get-WindowsOptionalFeature -Online -FeatureName NetFx4Extended-ASPNET45).State -eq "Disabled"){
    Write-Output "Installing NetFx4Extended-ASPNET45"
    Enable-WindowsOptionalFeature -Online -FeatureName NetFx4Extended-ASPNET45
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45).State -eq "Disabled"){
    Write-Output "Installing IIS-NetFxExtensibility45"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions).State -eq "Disabled"){
    Write-Output "Installing IIS-ISAPIExtensions"
    Enable-WindowsOptionalFeature -Online -FeatureName  IIS-ISAPIExtensions
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter).State -eq "Disabled"){
    Write-Output "Installing IIS-ISAPIFilter"
    Enable-WindowsOptionalFeature -Online -FeatureName  IIS-ISAPIFilter
}

if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45).State -eq "Disabled"){
    Write-Output "Installing IIS-ASPNET45"
    Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
}

Import-Module WebAdministration

if(Test-Path "IIS:\Sites\$($pp['Site'])\$($pp['Name'])")
{
    Write-Output "Removing Existing Website"
    Remove-WebSite "$($pp['Site'])\$($pp['Name'])"
}

if (!$UseExistingAppPool){
    
    if(Test-Path "IIS:\AppPools\$($pp['AppPool'])")
    {
        Write-Output "Removing Existing AppPool"
        Remove-WebAppPool $pp['AppPool']
    }

    $pool = New-Item "IIS:\AppPools\$($pp['AppPool'])"
    #Add User Setup with random password
    $pool.processModel.identityType = 4
    $pool | set-item
}

Write-Output "Creating new website"
New-WebApplication -Name $pp['Name'] -Site $pp['Site'] -PhysicalPath $pp['InstallLocation'] -ApplicationPool $pp['AppPool']

if ($pp['Port']){
    Set-WebBinding -Name $pp['Site'] -BindingInformation "*:80:" -PropertyName Port -Value $pp['Port']
}

$AppDataPath = Join-Path -Path $pp['InstallLocation'] -ChildPath "App_Data"
$AppPoolUser = "IIS APPPOOL\$($pp['AppPool'])"
$Acl = Get-Acl $AppDataPath
$permission = $Acl.Access | Where-Object{$_.IdentityReference -match $AppPoolUser} | Select-Object IdentityReference,FileSystemRights
If (!$permission){
    $AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule($AppPoolUser, "FullControl", "ContainerInherit,Objectinherit", "none", "Allow")
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $AppDataPath $Acl
}      