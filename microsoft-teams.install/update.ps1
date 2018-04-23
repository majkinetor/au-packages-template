import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    # 32bit
    $response = Invoke-WebRequest -Uri "http://aka.ms/teams32bitmsi" -Method Head -MaximumRedirection 0 -ErrorAction Ignore
    $url32 = $response.Headers.Location

    #https://statics.teams.microsoft.com/production-windows-x64/1.1.00.7855/Teams_windows.msi

    $response = Invoke-WebRequest -Uri "http://aka.ms/teams64bitmsi" -Method Head -MaximumRedirection 0 -ErrorAction Ignore
    $url64 = $response.Headers.Location

    $url32 -match ".*\/(?<version>\d+\.\d+\.\d+\.\d+)\/Teams_windows\.msi"   

    $version = $Matches.version
    
    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
