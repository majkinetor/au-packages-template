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

function GetStream($download, [version] $nextVersion)
{
    $minVersion = New-Object version $nextVersion.Major, ($nextVersion.Minor-1), $nextVersion.Build, $nextVersion.Revision
    $download | Where-Object { [version] $_.version -ge $minVersion} |
        Where-Object { [version] $_.version -lt $nextVersion } | 
        Select-Object -Last 1 | 
        ForEach-Object {
        @{ 
            URL32 = "https://www.ubnt.com" + $_.file_path
            Version = $_.version
            ReleaseNotes = $_.changelog
        }
    }
}

function global:au_GetLatest {

    $headers = @{
        "accept"="application/json"
        "X-Requested-With"="XMLHttpRequest"
    }

    $response = Invoke-RestMethod -Uri "https://www.ubnt.com/download/?platform=unifi" -Headers $headers

    $download = $response.downloads | Where-Object { 
            $_.category__slug -eq "software" `
            -and $_.filename.EndsWith(".exe") `
            -and -not ($_.version.StartsWith("v")) `
        } |
        Sort-Object { [version] $_.version };

    $latest = @{
        Streams = [ordered] @{
        }
    }

    $i = 5
    $stream = GetStream $download "5.$i.0.0"
    while ($stream) {
        $latest.Streams.Add("5.$($i - 1)", $stream)
        $i++
        $stream = GetStream $download "5.$i.0.0"
    }

    $latest
}

update -ChecksumFor 32