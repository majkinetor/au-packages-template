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

function GetStream($download, [version] $minVersion)
{
    $nextVersion = New-Object version $minVersion.Major, ($minVersion.Minor+1), $minVersion.Build, $minVersion.Revision
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

    $uniqueVersions = $download | % {  [Version] $_.Version; } | % { "$($_.Major).$($_.Minor)" } | Sort-Object -Unique -Descending

    $uniqueVersions | ForEach-Object {
        $stream = GetStream $download "$_.0.0"

        if ($stream) {
            $latest.Streams.Add($_, $stream)
        }
    }

    $latest
}

update -ChecksumFor 32