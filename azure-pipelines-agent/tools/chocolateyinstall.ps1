$ErrorActionPreference = 'Stop'; # stop on all errors

$url = 'https://vstsagentpackage.azureedge.net/agent/2.169.1/vsts-agent-win-x86-2.169.1.zip'
$url64 = 'https://vstsagentpackage.azureedge.net/agent/2.169.1/vsts-agent-win-x64-2.169.1.zip'
$checksum = '339b8591b5705d7c13728ed0e5c5658baf75943d3f46df6d9c3f65890fbc814e'
$checksum64 = 'c71397d81fa1e1e624616b8fab57b3188ddd40c583a8d5477391d1440ae46d3a'

$pp = Get-PackageParameters

if (!$pp['Directory']) { $pp['Directory'] = 'c:\agent' }

$configOpts = @()

# We only run config.cmd if a Url is supplied
if ($pp['Url']) {

    $configOpts = @('configure', '--unattended', '--acceptTeeEula')
    $configOpts += @('--url', $pp['Url'])
    if ($pp['CollectionName']) {
        $configOpts += @('--CollectionName', $pp['CollectionName'])
    }
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
    # Are we a deployment agent, environment, or a build agent?
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
    elseif ($pp['Environment']) {
        Write-Verbose "Environment Agent"

        if (!$pp['EnvironmentName'] -or !$pp['ProjectName']) {
            Write-Error "Must specify /EnvironmentName and /ProjectName"
        }

        $configOpts += @("--environment", "--environmentName", $pp['EnvironmentName'])

        if ($pp['EnvironmentTags']) {
            $configOpts += @("--addVirtualMachineResourceTags", "--virtualMachineResourceTags", $pp['EnvironmentTags'])
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

    # Agent name
    if ($pp['AgentName']) {
        $configOpts += @("--agent", $pp['AgentName'])
    }

    # Replace existing agent
    if ($pp['Replace']) {
        $configOpts += @("--replace")
    }

    # Self-signed certificate
    if ($pp['SslSkipCertValidation']) {
        $configOpts += @("--sslskipcertvalidation")
    }

    # Git use SChannel
    if ($pp['GitUseSChannel']) {
        $configOpts += @("--gituseschannel")
    }

    # Client Certificate
    if ($pp['UseClientCertificate']) {
        if (!$pp['SslCaCert'] -or !$pp['SslClientCert'] -or !$pp['SslClientCertKey'] -or !$pp['SslClientCertArchive'] -or !$pp['SslClientCertPassword']) {
            Write-Error "Must specify /SslCaCert, /SslClientCert, /SslClientCertKey, /SslClientCertArchive and /SslClientCertPassword"
        }
        $configOpts += @(
            "--sslcacert", $pp['SslCaCert'],
            "--sslclientcert", $pp['SslClientCert'],
            "--sslclientcertkey", $pp['SslClientCertKey'],
            "--sslclientcertarchive", $pp['SslClientCertArchive'],
            "--sslclientcertpassword", $pp['SslClientCertPassword']
        )
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
