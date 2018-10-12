import-module au

function global:au_SearchReplace {
    @{ }
}

function global:au_BeforeUpdate() {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {

    $response = Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/navossoc/KeePass-Yet-Another-Favicon-Downloader/releases/latest"
    
    if (!$response.name.StartsWith("v")) {
        return @{}
    }

    $version = $response.name.Substring(1)

    $release_id = $response.id

    $assets = Invoke-RestMethod -Method Get -Uri "https://api.github.com/repos/navossoc/KeePass-Yet-Another-Favicon-Downloader/releases/$release_id/assets"

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
