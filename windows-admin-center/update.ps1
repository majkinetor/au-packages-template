import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"     = "`$1'$($Latest.Url32)'"
            "(^[$]checksum\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum32)'"
        }
        'windows-admin-center.nuspec' = @{
            "(\<title\>).*?(\</title\>)" = "`${1}Windows Admin Center ($($Latest.DisplayVersion))`$2"
        }
     }
}

function global:au_GetLatest {

    $Latest = @{}

    try {
        # Get latest version from XML
        $response = Invoke-WebRequest -Method Head -Uri "https://aka.ms/WACDownload" -MaximumRedirection 0 -ErrorAction Ignore

        $url = $response.Headers.Location -replace "http:", "https:"

        # https://download.microsoft.com/download/1/0/5/1059800B-F375-451C-B37E-758FFC7C8C8B/WindowsAdminCenter1809.msi
        $url -match "WindowsAdminCenter(?<version>\d+(\.\d+)?)\.msi$"

        Write-Verbose "Downloading $url"
        $client = new-object System.Net.WebClient
        $downloadedFile = [IO.Path]::GetTempFileName()

        $client.DownloadFile($url, $downloadedFile)

        $version = (.\Get-MSIInfo.ps1 -Path $downloadedFile -Property ProductVersion)[3]

        Write-Verbose "$version"
        $checksum = (Get-FileHash $downloadedFile -Algorithm SHA256).Hash
        Write-Verbose "$checksum"

        Remove-Item $downloadedFile -Force -ErrorAction Ignore

        $Latest = @{
            Version = $version
            DisplayVersion = $Matches.version
            Url32 = $url
            Checksum32 = $checksum
        }
    }
    catch {
        Write-Error $_
    }
    return $Latest
}

update -ChecksumFor none