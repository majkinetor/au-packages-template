import-module au

$releases = 'https://sourceforge.net/projects/armagetronad/files/stable/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $version_download   = $download_page.links | Where-Object href -match '/projects/armagetronad/files/stable/*/' | ForEach-Object href | Select-Object -First 1 | Split-Path -leaf
	$version = $version_download
	while(([regex]::Matches($version, "\." )).count -gt 3) {
		$version = $version -replace "(.*)\.(.*)", '$1$2'
	}
    @{
        URL32   = "https://sourceforge.net/projects/armagetronad/files/stable/$version_download/armagetronad-$version_download.gcc.win32.exe/download"
        Version = $version
    }
}

update