$ErrorActionPreference = 'Stop'; # stop on all errors

$options = @{
  version = $env:ChocolateyPackageVersion;
  unzipLocation = 'C:\';
  runAsSystem = $true;
  serviceName = 'TeamCity';
  userName = '';
  domain = '';
  password = '';
}

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\ChocolateyHelpers.ps1"

Set-ChocolateyPackageOptions $options
if ($options['userName'] -ne '' -and $options['password'] -ne '') {
  $options['runAsSystem'] = $false;
}

$filename = "TeamCity-$($env:ChocolateyPackageVersion).tar.gz"

$platformPackageName = 'teamcity'

$scriptPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$commonPath = $(Split-Path -parent $(Split-Path -parent $scriptPath))
$downloadFile = Join-Path  (Join-Path $commonPath $platformPackageName) $filename

$tempFolder = Get-ChocolateyPackageTempFolder $env:ChocolateyPackageName
$tarFile = Join-Path $tempFolder "TeamCity-$($env:ChocolateyPackageVersion).tar"

Get-ChocolateyUnzip -FileFullPath $downloadFile -Destination $tempFolder
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $options['unzipLocation']

$binPath = Join-Path $options['unzipLocation'] 'TeamCity\bin'

Push-Location $binPath
$args = New-Object System.Collections.ArrayList

$args.Add('service') | Out-Null
$args.Add('install') | Out-Null

if ($options['runAsSystem']) {
  $args.Add('/runAsSystem') | Out-Null
}
else {
  $args.Add("/user=`"$($options['userName'])`"") | Out-Null
  $args.Add("/password=`"$($options['password'])`"") | Out-Null
  if ($options['domain'] -ne '')
  {
    $args.Add("/domain=`"$($options['domain'])`"") | Out-Null
  }
}
$joined = $($args -join ' ')
Start-ChocolateyProcessAsAdmin "$binPath\teamcity-server.bat $joined"
Pop-Location

$options['password'] = '';
Export-CliXml -Path (Join-Path $PSScriptRoot 'options.xml') -InputObject $options

Remove-Item $tarFile
