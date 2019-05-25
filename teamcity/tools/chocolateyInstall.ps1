$checksum = 'c2a34049012d6a7846f0d384c45fed72e46e00eb20c1228aa2a258b8b3432390'

$options = @{
  version = $env:ChocolateyPackageVersion;
  unzipLocation = 'C:\';
  runAsSystem = $true;
  serviceName = 'TeamCity';
  userName = '';
  domain = '';
  password = '';
}

# https://download.jetbrains.com/teamcity/TeamCity-2018.1.4.tar.gz.sha256 
$packageParameters = @{
  packageName = 'teamcity';
  url = "https://download.jetbrains.com/teamcity/TeamCity-$($options['version']).tar.gz";
  checksum = $checksum;
  checksumType = 'Sha256';
}

if(!$PSScriptRoot){ $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }
. "$PSScriptRoot\ChocolateyHelpers.ps1"

Set-ChocolateyPackageOptions $options
if ($options['userName'] -ne '' -and $options['password'] -ne '') {
  $options['runAsSystem'] = $false;
}

$service = Get-Service | Where-Object Name -eq $options['serviceName']
if ($service -ne $null) {
  Stop-Service $service
}

$binPath = Join-Path $options['unzipLocation'] 'TeamCity\bin'
if ((Test-Path $binPath) -and ($service -ne $null)) {

  Push-Location $binPath
  Start-ChocolateyProcessAsAdmin '.\teamcity-server.bat service delete'
  Pop-Location
}

$tempFolder = Get-ChocolateyPackageTempFolder $packageParameters['packageName']
$downloadFile = Join-Path $tempFolder "TeamCity-$($options['version']).tar.gz"
$tarFile = Join-Path $tempFolder "TeamCity-$($options['version']).tar"
Get-ChocolateyWebFile @packageParameters -FileFullPath $downloadFile
Get-ChocolateyUnzip -FileFullPath $downloadFile -Destination $tempFolder
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $options['unzipLocation']

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
Start-ChocolateyProcessAsAdmin ".\teamcity-server.bat $joined"
Pop-Location

$options['password'] = '';
Export-CliXml -Path (Join-Path $PSScriptRoot 'options.xml') -InputObject $options

Remove-Item $tarFile
