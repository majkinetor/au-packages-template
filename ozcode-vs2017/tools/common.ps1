# Find latest VS 2017 instance
# We can't use Install-ChocolateyVsixPackage for 2017 yet.
$xml = [xml] (vswhere -version "[15.0,17.0)" -requires Microsoft.Net.ComponentGroup.DevelopmentPrerequisites -format xml)

if (-not $xml.instances.HasChildNodes) {
    Write-Error "No suitable instances of Visual Studio 2017 or 2019 were found to install OzCode"
}

# Use highest version's VSIXInstaller
$vsixInstaller = (Join-Path $xml.instances.FirstChild.installationPath "Common7\IDE\VSIXInstaller.exe")

$vsInstances = $xml.instances.instance.instanceId -join ","

if (-not (Test-Path $vsixInstaller)) {
    Write-Error "Could not find VSIXInstaller.exe"
}
