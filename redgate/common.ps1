param(
    [string] $name,
    [switch] $readVersionFromInstaller
)

import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)(['`"].*['`"])"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {

    try {
        # Get last modified from web download
        Write-Verbose "Get last modified from https://download.red-gate.com/$name.exe"
        $response = Invoke-WebRequest "https://download.red-gate.com/$name.exe" -Method Head
        $lastModifiedHeader = $response.Headers.'Last-Modified'
        $lastModified = [DateTimeOffset]::Parse($lastModifiedHeader, [Globalization.CultureInfo]::InvariantCulture)

        if([datetimeoffset](get-date) -lt $lastModified.AddDays(-2)){
            # Make sure the release is at least 1 day old before we make a package for it.
            # That's because Redgate can sometimes release toolbelts multiple times per day.
            # Because installers are released in a yyyy-MM-dd subfolder, previous installers
            # released in the same day are overriden which will cause
            # checksums to mismatch if we generate the chocolatey package too quickly.
            return 'ignore'
        }

        # Redgate's installers are uploaded to https://download.red-gate.com/installers/<name>/<date-released>/<name>.exe
        # and the main https://download.red-gate.com/<name>.exe is just a redirect.
        # so use the url with the date to keep the chocolatey package stable and do away with checksum errors.
        $dateReleased = $lastModified.ToString("yyyy-MM-dd")
        $downloadUrl = "https://download.red-gate.com/installers/$name/$dateReleased/$name.exe"

        $downloadedFile = [IO.Path]::GetTempFileName()

        Write-Verbose "Downloading $downloadUrl"
        try {
            
            $client = new-object System.Net.WebClient
            $client.DownloadFile($downloadUrl, $downloadedFile)

            if($readVersionFromInstaller.IsPresent) {
                # SqlSearch has strange FileVersion, so use FileVersionRaw as that seems correct
                $version = (get-item $downloadedFile).VersionInfo.FileVersionRaw
            } else {
                # Some of Redgate's installers are bundles of other installers. (The toolbelts and dev bundles)
                # In that case, the version number embedded in the installer is irrelevant.
                # So use the date the installer was released instead.
                $version = $lastModified.ToString("yyyy.MM.dd")
            }
            Write-Verbose "$version"
            $checksum = (Get-FileHash $downloadedFile -Algorithm SHA256).Hash
            Write-Verbose "$checksum"

            Remove-Item $downloadedFile

            $Latest = @{ 
                URL32 = $downloadUrl
                Version = $version
                Checksum32 = $checksum
                LastModified = $lastModified
            }
        }
        catch {
            Write-Warning "Could not find file $downloadUrl"
            $Latest = 'ignore'
        }
    } catch {
        Write-Error $_

        $Latest = 'ignore'
    }
     
    return $Latest
}

update -ChecksumFor none