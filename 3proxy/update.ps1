import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$url\s*=\s*)('.*')"                 = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"              = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*\`$urlVista2003\s*=\s*)('.*')"        = "`$1'$($Latest.URLLite)'"
            "(?i)(^\s*\`$checksum\s*=\s*)('.*')"            = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"            = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*\`$checksumVista2003\s*=\s*)('.*')"   = "`$1'$($Latest.ChecksumVista2003)'"
        }
    }
}

function global:au_GetLatest {
    $release = curl -UseBasicParsing "https://api.github.com/repos/z3APA3A/3proxy/releases/latest?client_id=$env:GITHUB_CLIENT_ID&client_secret=$env:GITHUB_CLIENT_SECRET" | ConvertFrom-Json
	
	$version = $release.tag_name
	
	$Latest = @{
		URL32   = ($release.assets -match "3proxy-$version.zip").browser_download_url
		URL64   = ($release.assets -match "3proxy-$version-x64.zip").browser_download_url
		URLLite = ($release.assets -match "3proxy-$version-lite.zip").browser_download_url
        Version = $version
    }
	
	$Latest.Checksum32 = Get-RemoteChecksum $Latest.URL32
	$Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
	$Latest.ChecksumVista2003 = Get-RemoteChecksum $Latest.URLLite
	
	$Latest
}

update
