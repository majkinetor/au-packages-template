import-module au

$releases = 'https://sourceforge.net/projects/snmpb/files/snmpb/'

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

    $version   = $download_page.links | Where-Object href -match '/projects/snmpb/files/snmpb/*/' | ForEach-Object href | Select-Object -First 1 | Split-Path -leaf

    @{
        URL32   = "https://sourceforge.net/projects/snmpb/files/snmpb/$version/snmpb-$version.exe/download"
        Version = $version
    }
}

update
