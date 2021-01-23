$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters
if (!$pp['HyperVisor']) { $pp['HyperVisor'] = "Hyper-V" }
$winversion = Get-WmiObject Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber
if ($pp['HyperVisor'] -match 'Hyper-*V') {
  if (((($winversion.Caption) -match '.*10.*Pro.*') -or (($winversion.Caption) -match '.*10.*Enterprise.*') -or (($winversion.Caption) -match '.*10.*Корпоративная.*')) -and ($winversion.BuildNumber -gt 17134)) {
    if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer).State -eq "Disabled") {
      Write-Output "Installing Hyper-V"
      Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
    }
  }
  else {
    throw "Hyper-V requires Windows 10 Pro/Enterprise with a build version > 17134"
  }
}
elseif (!$pp['HyperVisor'] -match 'Virtual\s*Box') {
  throw "$($pp['HyperVisor']) is not a valid HyperVisor for this machine."
}

$args = @{ 
  PackageName = $env:ChocolateyPackageName
  FileType = 'exe'
  SilentArgs = '/S'
  Url64bit = 'https://github.com/CanonicalLtd/multipass/releases/download/v1.5.0/multipass-1.5.0+win-win64.exe'
  Checksum64 = 'b5b7d0f171ad0a5a5ac123bd24d94fabe49b1a7bd88986fa0bfbf12f6a735c3d3658a41330bce60d084e5a506872eb213853852c42b3cb09160779ccf03929b7'
  ChecksumType64 = 'sha512'
}

Install-ChocolateyPackage  @args
  

Install-BinFile `
  -Name $env:ChocolateyPackageName `
  -Path "$env:ProgramFiles\Multipass\bin\multipass.exe" `

if ($pp['HyperVisor'] -match 'Virtual\s*Box') {

  Write-Host "Virtual-Box must be installed to use this option"
  & "$env:ProgramFiles\Multipass\bin\multipass.exe" set local.driver=virtualbox
}
