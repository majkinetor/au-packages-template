$releases = "https://api.github.com/repos/lierdakil/pandoc-crossref/releases"

function global:au_GetLatest {
    $json = (Invoke-WebRequest $releases -UseBasicParsing | ConvertFrom-Json)[0];
    $max = New-Object PSObject | select pandocver,ghcver,url
    $max.ghcver = 0
    $max.pandocver = 0
    foreach( $asset in $json.assets)
    {
        if($asset.name -match "windows-ghc(\d.*?)-pandoc(.*?)\.zip")
        { 
            $pandocver = $matches[2] -replace "-","."
            $ghcver = $matches[1]
            if( $ghcver -ge $max.ghcver -and  $pandocver -ge $max.pandocver)
            {
                $max.ghcver = $ghcver;
                $max.pandocver = $pandocver;

                $max.url = $asset.browser_download_url;
            }
        }
    }
    return @{ 
        Version = $json.tag_name -replace "v" , "";
        URL32 = $max.url
        ChecksumType32 = 'sha256'
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           #1
            "(?i)(^\s*checksum\s*=\s*)'.*'"   = "`$1'$($Latest.Checksum32)'"      #2
        }
    }
}


Update-Package