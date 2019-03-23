$ErrorActionPreference = 'Stop'; # stop on all errors

$url = 'https://vstsagentpackage.azureedge.net/agent/2.148.2/vsts-agent-win-x86-2.148.2.zip'
$url64 = 'https://vstsagentpackage.azureedge.net/agent/2.148.2/vsts-agent-win-x64-2.148.2.zip'
$checksum = '7fe129ebfee13d15c428802fe235ac79cdab06bb2684d18a458a3d293d52dd95'
$checksum64 = '99f522fdf19e8b410fa29796a4c8e8b57c180268d6a06943ef352b4b6253e7b7'

$pp = Get-PackageParameters

if (!$pp['Directory']) { $pp['Directory'] = 'c:\agent' }

$configOpts = @()

# We only run config.cmd if a Url is supplied
if ($pp['Url']) {

    $configOpts = @('configure', '--unattended', '--acceptTeeEula')
    $configOpts += @('--url', $pp['Url'])

    if ($pp['Token']) {
        $configOpts += @("--auth", "pat", "--token", $pp['Token'])
    }
    else {
        if (!$pp['Auth']) {
            Write-Error "You need to specify an auth type with /Auth= 'negotiate', 'alt' or 'integrated'"
        }
        
        $configOpts += @("--auth", $($pp['Auth']))

        if ($pp['Auth'] -ine 'integrated') {
            $username = $pp['Username']
            $password = $pp['Password']

            if (!$username -or !$password) {
                Write-Error "You must supply /username and /password"
            }
            
            $configOpts += @("--userName", $username, "--password", $password)
        }
    }
    # Are we a deployment agent or a build agent?
    if ($pp['DeploymentGroup']) {
        Write-Verbose "Deployment Agent"

        if (!$pp['DeploymentGroupName'] -or !$pp['ProjectName']) {
            Write-Error "Must specify /DeploymentGroupName and /ProjectName"
        }

        $configOpts += @("--deploymentGroup", "--deploymentGroupName", $pp['DeploymentGroupName'])
        if ($pp['DeploymentGroupTags']) {
            $configOpts += @("--addDeploymentGroupTags", "--deploymentGroupTags", $pp['DeploymentGroupTags'])
        }

        if ($pp['ProjectName']) {
            $configOpts += @('--projectName', $pp['ProjectName'])
        }
    }
    else {
        if (!$pp['Pool']) { $pp['Pool'] = 'default'}
      
        $configOpts += @("--pool", $pp['Pool'])
    }
    
    # AutoLogon(interactive) or as a service
    if ($pp['AutoLogon']) {
        $configOpts += @('--runAsAutoLogon', '--noRestart')
    }
    else {
        $configOpts += @('--runAsService')
    }

    if ($pp['LogonAccount']) {
        $configOpts += @("--windowsLogonAccount", $pp['LogonAccount'])

        if ($pp['LogonPassword']) {
            $configOpts += @("--windowsLogonPassword", $pp['LogonPassword'])
        }
    }

    # Work directory
    if ($pp['Work']) {
        $configOpts += @("--work", $pp['Work'])
    }
}

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = $pp['Directory']
    url            = $url
    url64bit       = $url64

    checksum       = $checksum
    checksumType   = 'sha256'
    checksum64     = $checksum64
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

if ($configOpts.Count) {
    Write-Verbose "$($packageArgs.unzipLocation)\bin\Agent.Listener.exe configure $configOpts"
    & "$($packageArgs.unzipLocation)\bin\Agent.Listener.exe" $configOpts
}
