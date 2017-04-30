$ErrorActionPreference = 'Stop';

$packageName= 'iguana.install'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://dl.interfaceware.com/iguana/windows/5_6/iguana_5_6_windows_x86.exe'
$url64      = 'http://dl.interfaceware.com/iguana/windows/5_6/iguana_5_6_windows_x64.exe'
$checksum   = '3E5D9C9F94C2F8EBCD669AE568F28B5F17F5E70738D660AF6F44F0460F7173BE'
$checksum64 = '4446F039467D33737B1AA61B70697167DBCD863FEC86669B62D2B68FAB1FFC20'

$packageParameters = $env:chocolateyPackageParameters

if ($env:chocolateyForceX86 -and (Get-ProcessorBits 64)) {
    $programfiles = ${env:ProgramFiles(x86)}
} else {
    $programfiles = $env:ProgramFiles
}

$arguments = @{}

# Default the values
$installationPath = "$programfiles\iNTERFACEWARE"
$log = "$installationPath\Iguana\Logs"
$port = "6543"
$excludeChameleon = $false

# Now parse the packageParameters using good old regular expression
if ($packageParameters) {
    $match_pattern = "\/(?<option>([a-zA-Z]+)):(?<value>([`"'])?([a-zA-Z0-9- _\\:\.]+)([`"'])?)|\/(?<option>([a-zA-Z]+))"
    $option_name = 'option'
    $value_name = 'value'

    if ($packageParameters -match $match_pattern ){
        $results = $packageParameters | Select-String $match_pattern -AllMatches
        $results.matches | % {
        $arguments.Add(
            $_.Groups[$option_name].Value.Trim(),
            $_.Groups[$value_name].Value.Trim())
        }
    }
    else
    {
        Throw "Package Parameters were found but were invalid (REGEX Failure)"
    }

    if ($arguments.ContainsKey("Port")) {
        Write-Host "Port Argument Found"
        $port = $arguments["Port"]
    }

    if ($arguments.ContainsKey("ExcludeChameleon")) {
        Write-Host "Chameleon will not be installed"
        $excludeChameleon = $true
    }

    if ($arguments.ContainsKey("InstallationPath")) {
        Write-Host "You want to use a custom Installation Path"
        $installationPath = $arguments["InstallationPath"]
    }

    if ($arguments.ContainsKey("Log")) {
        Write-Host "You want to use a custom Log Path"
        $log = $arguments["Log"]
    }

} else {
    Write-Debug "No Package Parameters Passed in"
}

<# 
 /DIRECTORY="path" - Install in this directory (default is C:\Program Files\iNTERFACEWARE)
 /CHAMELEON=1 - Install Chameleon
 /PORT="port" - Use this port for Iguana's web server (default is 6543)
 /LOG="path"  - Use this directory for Iguana's log files (default is <installation-directory>\Iguana\logs)
 #>

$silentArgs = "/S /PORT=`"" + $port + "`" /DIRECTORY=`"" + $installationPath + "`" /LOG=`"" + $log + "`""

if ($excludeChameleon) { 
    $silentArgs += " /CHAMELEON=0" 
}

Write-Debug "This would be the Chocolatey Silent Arguments: $silentArgs"

# predefine firewall rule to avoid Windows Firewall dialog during install
if (-not(Get-NetFirewallRule | Where { $_.DisplayName -eq "Iguana" })) {
    New-NetFirewallRule -Name "Iguana" -DisplayName "Iguana" -Profile Private -Direction Inbound -Action Allow -Program "$installationPath\Iguana\iguana.exe"
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'iNTERFACEWARE Iguana'

  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'

  silentArgs   = $silentArgs

  validExitCodes= @(0) 
}

Install-ChocolateyPackage @packageArgs
