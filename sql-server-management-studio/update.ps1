import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fullUrl\s*=\s*)('.*')"         = "`$1'$($Latest.FullUrl)'"
            "(^[$]fullChecksum\s*=\s*)('.*')"    = "`$1'$($Latest.FullChecksum)'"
            "(^[$]upgradeUrl\s*=\s*)('.*')"      = "`$1'$($Latest.UpgradeUrl)'"
            "(^[$]upgradeChecksum\s*=\s*)('.*')" = "`$1'$($Latest.UpgradeChecksum)'"
            "(^[$]release\s*=\s*)('.*')"         = "`$1'$($Latest.Release)'"
        }
     }
}

function Get-Download($url, $version)
{
    $request = Invoke-WebRequest -Uri $url -MaximumRedirection 0 -ErrorAction Ignore

    $r = @{}

    if($request.StatusCode -lt 400)
    {
        # $url        = 'http://download.microsoft.com/download/E/E/1/EE12CC0F-A1A5-4B55-9425-2AFBB2D63979/SSMS-Full-Setup.exe'

        $location = [UriBuilder] $request.Headers.Location

        # Switch to https
        $location.Scheme = "https"
        $location.Port = 443

        $url = $location.Uri
        Write-Host "Downloading $url"

        $filename = [IO.Path]::GetFileName($url)
        $destPath = "$($env:TEMP)\chocolatey\sql-server-management-studio\$version"

        if (-not (Test-Path $destPath)) {
            New-Item -ItemType Directory $destPath | Out-Null
        }

        $filename = [IO.Path]::Combine($destPath, $filename)

        if (Test-Path $filename) {
            Write-Warning "$filename already exists, skipping download"
        } else {

            $currentProgressPreference = $ProgressPreference
            $ProgressPreference = 'silentlyContinue'        
            Invoke-WebRequest -Uri $url -OutFile $filename
            $ProgressPreference = $currentProgressPreference
        }

        $hash = Get-FileHash $filename -Algorithm SHA256
        $r = @{
            url = $url
            checksum = $hash.Hash
        }
    }
    return $r
}

function global:au_GetLatest {

    $Latest = @{}

    try {
        # Get latest version from XML
        $response = Invoke-RestMethod -Uri "https://go.microsoft.com/fwlink/?LinkId=841665"
        $version = $response.component.version

        $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MicrosoftDocs/sql-docs/live/docs/ssms/download-sql-server-management-studio-ssms.md"
        $content = $response.Content

        # The version number for this latest preview is: 13.0.12000.65
        $isMatch = $content -match "([Rr]elease number: (?<release>\d+\.\d+(\.\d+){0,2}))"

        if ($isMatch)
        {
            $release = $matches.release

            Write-Host "Found version $version, release $release"

            # Focus on 17.x for now.
            $downloadLinks = $content | Select-String -Pattern "Download SQL Server Management Studio 17.*\]\((https.*\d+)\)" -AllMatches

            if ($downloadLinks.Matches.Count -eq 2)
            {
                $first = Get-Download $downloadLinks.Matches[0].Groups[1].Value $version
                $second = Get-Download $downloadLinks.Matches[1].Groups[1].Value $version

                if($first.Count -and $second.Count)
                {
                    $Latest = @{
                        Version = $version
                        Release = $release
                        FullChecksum = $first.checksum
                        FullUrl = $first.url
                        UpgradeUrl = $second.url
                        UpgradeChecksum = $second.checksum
                    }
                    return $Latest

                } else {
                    Write-Warning "first.Count and/or second.Count were zero"
                }
            } else {
                Write-Warning "Could not find download links"
            }
        } else {
            Write-Warning "Regex match was false"
        }
    }
    catch {
        Write-Error $_
    }

    return 'ignore'
}

update -ChecksumFor none -NoCheckChocoVersion