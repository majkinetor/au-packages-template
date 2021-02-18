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
  Url64bit = 'https://github.com/canonical/multipass/releases/download/v1.6.2/multipass-1.6.2+win-win64.exe'
  Checksum64 = '133fef8642b5f21f153fe85799fe6e10d4d65d01ba1a111684b880474146f05242bf207b97e065ed170da68e0f5d4f57d018dca62eebf20bf347d534b7e66d6e'
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
