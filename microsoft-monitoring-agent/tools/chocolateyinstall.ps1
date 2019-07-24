$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# package parameters
$pp = Get-PackageParameters

if ($pp['WorkspaceId'] -and $pp['WorkspaceKey']) {
  $azureArgs = "ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_ID=$($pp['WorkspaceId']) OPINSIGHTS_WORKSPACE_KEY=$($pp['WorkspaceKey'])"
  Write-Verbose "Configuring with Azure Monitor workspace"
} elseif ($pp['WorkspaceId'] -or $pp['WorkspaceKey']) {
  throw "Both WorkspaceId and WorkspaceKey package parameters must be supplied"
} else {
  Write-Host "Installing agent, but configuration will need to be done via Control Panel app"
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Microsoft Monitoring Agent'
  fileType      = 'exe'

  # https://github.com/MicrosoftDocs/azure-docs/issues/29171
  # https://docs.microsoft.com/en-us/azure/azure-monitor/platform/agent-windows#install-the-agent-using-the-command-line
  silentArgs    = "/C:`"setup.exe /qn NOAPM=1 $azureArgs AcceptEndUserLicenseAgreement=1`""
  
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://go.microsoft.com/fwlink/?LinkId=828604"
  checksum      = '2986B39E819E2C16F524DB2AF318779E0E8EAC72819592227090C1BB4C8381CE'
  checksumType  = 'sha256'
  url64bit      = "https://go.microsoft.com/fwlink/?LinkId=828603"
  checksum64    = '98412487E7E98306D0476361EBF6F4B008DAC528B9B481A9E83A503CD00DCE90'
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs
