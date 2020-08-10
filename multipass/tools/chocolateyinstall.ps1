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
  Url64bit = 'https://github.com/CanonicalLtd/multipass/releases/download/v1.4.0/multipass-1.4.0+win-win64.exe'
  Checksum64 = '895d83eb1e2e798fcac05340bfc0f19ffa6b88e6baa60683b7d9f2c7a74b5d02f2ed2317a646abdb2c606b70a3efd43f9bc76ca942edeef7573bfa88e3bf7e4a'
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
