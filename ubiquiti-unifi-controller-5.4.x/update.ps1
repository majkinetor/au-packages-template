. "$PSScriptRoot\..\ubiquiti-unifi-controller\update.ps1"

import-module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

function global:au_GetLatest {

    $headers = @{
        "accept"="application/json"
        "X-Requested-With"="XMLHttpRequest"
    }

    $response = Invoke-RestMethod -Uri "https://www.ubnt.com/download/?platform=unifi" -Headers $headers
    $nextVersion = [version] "5.5.0.0"
    $download = $response.downloads | Where-Object { 
        $_.category__slug -eq "software" `
        -and $_.filename.EndsWith(".exe") `
        -and -not ($_.version.StartsWith("v")) `
        -and ([version] $_.version -lt $nextVersion) 
    } | 
    Sort-Object -Descending { [version] $_.version } |
    Select-Object -First 1
    
    $url = "https://www.ubnt.com" + $download.file_path

    $Latest = @{ 
        URL32 = $url
        Version = $download.version
        ReleaseNotes = $download.changelog
    }
    $Latest.PackageName = 'ubiquiti-unifi-controller'
    return $Latest
}

function global:au_BeforeUpdate {
  $Latest.ChecksumType32 = 'sha256'
  $Latest.Checksum32 = Get-RemoteChecksum -Algorithm $Latest.ChecksumType32 -Url $Latest.URL32
  # Copy the original file from the virtualbox folder
  if (!(Test-Path "$PSScriptRoot\tools" -PathType Container)) { New-Item -ItemType Directory "$PSScriptRoot\tools" }
  Copy-Item "$PSScriptRoot\..\ubiquiti-unifi-controller\tools" "$PSScriptRoot" -Force -Recurse
}

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "$($Latest.PackageName)-5.4.x.nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
     }
}

update -ChecksumFor none