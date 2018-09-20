import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    # 32bit
    
    $url32 = "https://aka.ms/vsts-cli-windows-installer"
    for ($i = 0; ($i -lt 4) -and (-not ($url32.EndsWith(".msi"))); $i++) {
        $response = Invoke-WebRequest -Uri $url32 -Method Head -MaximumRedirection 0 -ErrorAction Ignore

        $url32 = $response.Headers.Location
    }

    if ($i -ge 3) {
        return @{}
    }

    # https://vstscli.blob.core.windows.net/msi/vsts-cli-0.1.3.msi
    
    $url32 -match "-(?<version>\d+\.\d+\.\d+)\.msi$"   

    $version = $Matches.version
    
    $Latest = @{ URL32 = $url32; Version = $version }
    return $Latest
}

update
