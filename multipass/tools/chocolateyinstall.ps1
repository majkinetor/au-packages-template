$ErrorActionPreference = 'Stop';
$pp = Get-PackageParameters
if(!$pp['HyperVisor']) {$pp['HyperVisor'] = "Hyper-V"}
$url64 = ''
$checksum64 = ''
$checksumType64 = 'sha512'
Install-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/S' -Url64bit $url64 -Checksum64 $checksum64 -ChecksumType64 $checksumType64
  # [-Url64bit <String>] `
  # [-ValidExitCodes <Object>] `
  # [-Options <Hashtable>] `
  # [-File <String>] `
  # [-File64 <String>] `
  # [-UseOnlyPackageSilentArguments] `
  # [-UseOriginalLocation] `
  # [-IgnoredArguments <Object[]>] [<CommonParameters>]<#  #>
  
 $winversion = Get-WmiObject Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber
if($pp['HyperVisor'] -match '[Hh][Yy][Pp][Ee][Rr]-{0,1}[Vv]'){
  if(((($winversion.Caption) -match '.*10.*[Pp][Rr][Oo].*') -or (($winversion.Caption) -match '.*10.*[Ee]nterprise.*')) -and ($winversion.BuildNumber -gt 17134)){
    if ((Get-WindowsOptionalFeature -Online -FeatureName IIS-WebServer).State -eq "Disabled"){
      Write-Output "Installing Hyper-V"
      Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
    }
  }
  else{
    Write-Host "Hyper-V requires Windows 10 Pro/Enterprise with a build version > 17134"
  }
}
elseif(!$pp['HyperVisor'] -match '[Vv][Ii][Rr][Tt][Uu][Aa][Ll]\s*[Bb][Oo][Xx]'){
  ThrowError -ExceptionMessage "$($pp['HyperVisor']) is not a valid HyperVisor for this machine."

}

Install-BinFile `
  -Name $env:ChocolateyPackageName `
  -Path "$env:ProgramFiles\Multipass\bin\multipass.exe" `

if($pp['HyperVisor'] -match '[Vv][Ii][Rr][Tt][Uu][Aa][Ll]\s*[Bb][Oo][Xx]'){

  Write-Host "Virtual-Box muse be installed to use this option"
  & "$env:ProgramFiles\Multipass\bin\multipass.exe" set local.driver=virtualbox
}