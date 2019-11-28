import-module au

$releases = "https://github.com/JanDeDobbeleer/oh-my-posh/releases"

function global:au_SearchReplace {
  @{
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $regex   = '\/JanDeDobbeleer\/oh-my-posh\/releases\/tag\/\d{1,3}\.\d{1,3}\.\d{1,3}$'
  $url     = $download_page.links | Where-Object href -match $regex | Select-Object -First 1 -expand href
  $version = $url -split '\/' | Select-Object -Last 1
  Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
  Save-Module -RequiredVersion $version -Name 'oh-my-posh' -Force -Path './'
  Write-Host "Saved Module"
  if (Test-Path 'tools/module'){
  Remove-Item -Path 'tools/module' -Force -Recurse
  }
    New-Item -Path 'tools/module' -ItemType Directory
  
  Remove-Item -Path "./oh-my-posh/$version/*.git*" -Force -Recurse
  Remove-Item -Path "./oh-my-posh/$version/*.yml" -Force -Recurse
  Remove-Item -Path "./oh-my-posh/$version/Build" -Force -Recurse
  Remove-Item -Path "./oh-my-posh/$version/.vscode" -Force -Recurse
  Remove-Item -Path "./oh-my-posh/$version/TestsResults.xml" -Force
  Copy-Item -Path "./oh-my-posh/$version/*" -Destination 'tools/module' -Recurse
  Remove-Item -Path "./oh-my-posh/" -Force -Recurse
  return @{ Version = $version; }
}

Update-Package -ChecksumFor none