import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
     }
}

function global:au_GetLatest {

    $headers = @{
        "accept"="application/json"
        "X-Requested-With"="XMLHttpRequest"
    }

    $response = Invoke-RestMethod -Uri "https://www.ubnt.com/download/?platform=unifi" -Headers $headers

    $download = $response.downloads | Where-Object { $_.Featured -and $_.category__slug -eq "software" -and $_.filename.EndsWith(".exe") } | Sort-Object -Property version  -Descending | Select-Object -First 1

    $url = "https://www.ubnt.com" + $download.file_path

    $Latest = @{ 
        URL32 = $url
        Version = $download.version
        ReleaseNotes = $download.changelog
    }
    return $Latest
}

if ($MyInvocation.InvocationName -ne '.') {

  update -ChecksumFor 32
}