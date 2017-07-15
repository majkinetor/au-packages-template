import-module au

$releases = 'https://www.scootersoftware.com/download.php'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^\`$version\s*=\s*)('.*')"    = "`$1'$($Latest.Version)'"
            "(^\`$checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum_EN)'"
            "(^\`$checksumde\s*=\s*)('.*')" = "`$1'$($Latest.Checksum_DE)'"
            "(^\`$checksumfr\s*=\s*)('.*')" = "`$1'$($Latest.Checksum_FR)'"
            "(^\`$checksumjp\s*=\s*)('.*')" = "`$1'$($Latest.Checksum_JP)'"
        }
    }
}

function global:au_GetLatest {
    # 32bit
    $download_page = Invoke-WebRequest -Uri $releases

    #https://www.scootersoftware.com/BCompare-4.2.1.22354.exe
    
    $content = $download_page.Content.Trim()

    $content -match "BCompare-(?<version>\d+\.\d+\.\d+\.\d+)\.exe"

    $version = $Matches.version

    $url_en = "https://www.scootersoftware.com/BCompare-$($version).exe"

    # https://www.scootersoftware.com/BCompare-de-4.2.1.22354.exe
    # https://www.scootersoftware.com/BCompare-fr-4.2.1.22354.exe
    # https://www.scootersoftware.com/BCompare-jp-4.2.1.22354.exe

    $url_de = "https://www.scootersoftware.com/BCompare-de-$($version).exe"
    $url_fr = "https://www.scootersoftware.com/BCompare-fr-$($version).exe"
    $url_jp = "https://www.scootersoftware.com/BCompare-jp-$($version).exe"

    $Latest = @{ 
        URL_EN = $url_en
        URL_DE = $url_de
        URL_FR = $url_fr
        URL_JP = $url_jp
        Version = $version 
    }

    return $Latest
}

function global:au_BeforeUpdate() {
    $Latest.Checksum_EN = Get-RemoteChecksum $Latest.URL_EN
    $Latest.Checksum_DE = Get-RemoteChecksum $Latest.URL_DE
    $Latest.Checksum_FR = Get-RemoteChecksum $Latest.URL_FR
    $Latest.Checksum_JP = Get-RemoteChecksum $Latest.URL_JP
}

update -ChecksumFor none