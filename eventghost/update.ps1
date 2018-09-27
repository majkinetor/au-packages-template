import-module au

$releases = 'https://api.github.com/repos/EventGhost/EventGhost/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases | ConvertFrom-Json

    $version   = $download_page[0].name
    if($version.StartsWith("v")) {
        $version = $version.Substring(1)
    }
    @{
        URL32   = $download_page[0].assets.browser_download_url
        Version = $version
    }
}

update