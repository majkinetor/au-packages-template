import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {

    $response = Invoke-RestMethod -Method Get -Uri "https://www.pingplotter.com/versioncheck/f/win5/"
    
    $Latest = @{
        Version = $response.NewVersion 
    }
    return $Latest
}

update
