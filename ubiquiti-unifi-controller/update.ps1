import-module au

$releases = 'https://www.ubnt.com/download/unifi/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {

    $headers = @{
        "accept"="application/json"
        "X-Requested-With"="XMLHttpRequest"
    }

    $response = Invoke-RestMethod -Uri "https://www.ubnt.com/download/?platform=unifi" -Headers $headers

    $download = $response.downloads | Where-Object { $_.Featured -and $_.category__slug -eq "software" -and $_.filename.EndsWith(".exe") } | select -First 1

    $url = "https://www.ubnt.com" + $download.file_path

    $Latest = @{ 
        URL32 = $url
        Version = $download.version
        ReleaseNotes = $download.changelog
    }
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = gc $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}$($Latest.ReleaseNotes)`$2"

    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update
