import-module au

$primaryDownloadUrl = "https://download.red-gate.com/SQLToolbelt.exe"

function global:au_SearchReplace {
    $d = [DateTimeOffset] $Latest.LastModified
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]secondaryDownloadUrl\s*=\s*)(['`"].*['`"])"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            # $packageVersionLastModified = New-Object -TypeName DateTimeOffset 2017, 7, 3, 11, 5, 0, 0 # Last modified time corresponding to this package version
            "(^[$]packageVersionLastModified\s*=\s*)(.*)(\s+\#)" = "`$1New-Object -TypeName DateTimeOffset $($d.Year), $($d.Month), $($d.Day), $($d.Hour), $($d.Minute), $($d.Second), 0`$3"

        }
    }
}

function global:au_GetLatest {

    try {
        # Get last modified from web download
        $response = Invoke-WebRequest $primaryDownloadUrl -Method Head
        $lastModifiedHeader = $response.Headers.'Last-Modified'
        $lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

        # Infer what the FTP download should be and grab that to find out the version (and indirectly confirm that the URL is correct)
        # $secondaryDownloadUrl = "ftp://support.red-gate.com/patches/SQLToolbelt/03Jul2017/SQLToolbelt.exe"
        $secondaryDownloadUrl = "ftp://support.red-gate.com/patches/SQLToolbelt/$($lastModified.ToString("ddMMMyyyy"))/SQLToolbelt.exe"

        $downloadedFile = [IO.Path]::GetTempFileName()

        $client = new-object System.Net.WebClient
        $client.DownloadFile($secondaryDownloadUrl, $downloadedFile)

        $version = (get-item $downloadedFile).VersionInfo.FileVersion

        $checksum = (Get-FileHash $downloadedFile -Algorithm SHA256).Hash

        Remove-Item $downloadedFile

        $Latest = @{ 
            URL32 = $secondaryDownloadUrl
            Version = $version
            Checksum32 = $checksum
            LastModified = $lastModified
        }
    } catch {
        Write-Error $_

        $Latest = @{}
    }
     
    return $Latest
}

update -ChecksumFor none