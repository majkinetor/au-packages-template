import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\`$url\s*=\s*)('.*')"    = "`$1'$($Latest.Url32)'"
            "(^\`$url64\s*=\s*)('.*')"   = "`$1'$($Latest.Url64)'"
            "(^\`$checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^\`$checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $releasesUrl = "https://api.github.com/repos/Microsoft/azure-pipelines-agent/releases"
    $response = Invoke-RestMethod -Method Get -Uri "$releasesUrl/latest"
    
    # Assume releases are named v1.2.3
    if (!$response.name.StartsWith("v")) {
        return @{}
    }

    $version = $response.name.Substring(1)

    $assets = Invoke-RestMethod -Method Get -Uri $response.assets_url

    $assetsJson = Invoke-RestMethod -Method Get -Uri $assets[0].browser_download_url

    $asset32 = $assetsJson | Where-Object { $_.platform -eq "win-x86" }
    $asset64 = $assetsJson | Where-Object { $_.platform -eq "win-x64" }
    $Latest = @{
        Url32 = $asset32.downloadUrl
        Url64 = $asset64.downloadUrl
        Version = $version
    }
    return $Latest
}

update