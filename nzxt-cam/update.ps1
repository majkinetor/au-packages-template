import-module au

$download = 'https://camwebapp.com/download/cam'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $url = [System.Net.HttpWebRequest]::Create($download).GetResponse().ResponseUri.AbsoluteUri
    $url -match '(?:(\d+)\.)?(?:(\d+)\.)?(?:(\d+)\.\d+)'
	$version = $matches[0]
    @{
        URL32   = $download
        Version = $version
    }
}

update