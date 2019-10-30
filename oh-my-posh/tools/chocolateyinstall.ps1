$ErrorActionPreference = 'Stop';
if (! (Get-Module -ListAvailable -Name 'posh-git')) {
  Write-Host "Posh-Git was not found in powershell modules."
  Write-Host "You may need to install Posh-Git manually or run 'Install-Module posh-git' before installing this package."
  Throw [System.Exception] "posh-git not found in `"Get-Module -ListAvailable -Name 'posh-git'`""
}

Remove-Module -Name $env:ChocolateyPackageName -Force -ErrorAction SilentlyContinue

$psModuleSource = Join-Path (Join-Path $env:ChocolateyInstall (Join-Path 'lib' $env:ChocolateyPackageName)) 'tools\module'

$PSModulePaths = $env:PSModulePath -split ';'
if($PSVersionTable.PSVersion.Major -gt 5){
  $Script:modulePath = Join-Path -Path $env:ProgramFiles -ChildPath "PowerShell\$($PSVersionTable.PSVersion.Major)\Modules\"
  if ($PSModulePaths -notcontains $modulePath) {
    Write-Verbose "Adding PSModulePath to PATH"
    $newPSModulePath = @($modulePath, $PSModulePaths) -join ';'
    [Environment]::SetEnvironmentVariable('PSModulePath', $newPSModulePath, 'Machine')
    $env:PSModulePath = $newPSModulePath
  }
    Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}
else{
  $Script:modulePath = Join-Path -Path $env:ProgramFiles -ChildPath 'WindowsPowerShell\Modules\'
  if ($PSModulePaths -notcontains $modulePath) {
    Write-Verbose "Adding PSModulePath to PATH"
    $newPSModulePath = @($modulePath, $PSModulePaths) -join ';'
    [Environment]::SetEnvironmentVariable('PSModulePath', $newPSModulePath, 'Machine')
    $env:PSModulePath = $newPSModulePath
  }
}

Copy-Item -Path $psModuleSource -Destination (Join-Path $Script:modulePath $env:ChocolateyPackageName) -Recurse -Force

# Add to Profile
if ($PROFILE -and (Test-Path $PROFILE)) {
  $oldProfile = @(Get-Content $PROFILE)

  $newProfile = @()
  foreach($line in $oldProfile) {
      if($line -like 'Import-Module posh-git') {
          $PoshGitInProfile = $true
      }
      if($line -like 'Import-Module oh-my-posh') {
        $OhMyPoshInProfile = $true
      }
      $newProfile += $line
  }

  if(-not $PoshGitInProfile){
    $newProfile += "Import-Module posh-git`n"
  }
  if(-not $OhMyPoshInProfile){
    $newProfile += "Import-Module oh-my-posh`n"
  }

  Set-Content -path $profile -value $newProfile -Force
  Write-Host "oh-my-posh has been added to your profile. You may wish to append 'Set-Theme paradox' to set a theme"
}
else{
  Write-Host "No Powershell Profile was found. You may wish to create a Profile and append 'Import-Module posh-git', 'Import-Module oh-my-posh', and 'Set-Theme paradox' to enable oh-my-posh"
}

Write-Host "You may need to change your Powershell Execution Policy to use $env:ChocolateyPackageName as the powershell profile is unsigned."