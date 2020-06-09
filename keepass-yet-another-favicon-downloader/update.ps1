import-module au

function global:au_SearchReplace {
    @{ }
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {

    $token = $env:github_api_key
    $headers = @{
        'User-Agent' = 'flcdrg'
    }
    if ($token) {
        $headers['Authorization'] = ("token {0}" -f $token)
    } else {
        Write-Warning "No auth token"
    }
    $response = Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/navossoc/KeePass-Yet-Another-Favicon-Downloader/releases/latest" -Headers $headers
    
    if (!$response.name.StartsWith("v")) {
        Write-Warning "Ignoring unexpected version"
        return 'ignore'
    }

    $version = $response.name.Substring(1)

    $assets = $response.assets

    $Latest = @{
        Url32 = $assets[0].browser_download_url
        Version = $version
        ReleaseNotes = $response.body
    }
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = Get-Content $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}$($Latest.ReleaseNotes)`$2"
    
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update -ChecksumFor none
