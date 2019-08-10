import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"     = "`$1'$($Latest.Url32)'"
            "(^[$]checksum32\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"     = "`$1'$($Latest.Url64)'"
            "(^[$]checksum64\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function GetDownloadInfo($url) {
    $response = Invoke-WebRequest -Method Head -Uri $url -MaximumRedirection 0 -ErrorAction Ignore

    $url = $response.Headers.Location -replace "http:", "https:"

    # https://download.microsoft.com/download/A/E/7/AE709F7E-37F5-473F-A615-42D6F66AE32F/MMASetup-i386.exe

    Write-Verbose "Downloading $url"
    $client = new-object System.Net.WebClient
    $downloadedFile = [IO.Path]::GetTempFileName()

    $client.DownloadFile($url, $downloadedFile)

    $versionInfo = (Get-Item $downloadedFile).VersionInfo

    $version = $versionInfo.ProductVersion

    $checksum = (Get-FileHash $downloadedFile -Algorithm SHA256).Hash

    Remove-Item $downloadedFile -Force -ErrorAction Ignore

    @{
        Url = $url
        Checksum = $checksum
        Version = $version
    }
}

function global:au_GetLatest {

    $Latest = @{}

    try {
        # Get latest versions
        $info32 = GetDownloadInfo "https://go.microsoft.com/fwlink/?LinkId=828604"
        $info64 = GetDownloadInfo "https://go.microsoft.com/fwlink/?LinkId=828603"

        # 32bit and 64bit versions are not necessarily the same. Assuming 64bit is the highest for now (until we see otherwise!)
        $Latest = @{
            Version = $info64.Version
            Url32 = $info32.Url
            Checksum32 = $info32.Checksum
            Url64 = $info64.Url
            Checksum64 = $info64.Checksum
        }
    }
    catch {
        Write-Error $_
    }
    return $Latest
}

update -ChecksumFor none