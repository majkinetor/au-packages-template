import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]fullUrl\s*=\s*)('.*')"         = "`$1'$($Latest.FullUrl)'"
            "(^[$]fullChecksum\s*=\s*)('.*')"    = "`$1'$($Latest.FullChecksum)'"
#            "(^[$]upgradeUrl\s*=\s*)('.*')"      = "`$1'$($Latest.UpgradeUrl)'"
#            "(^[$]upgradeChecksum\s*=\s*)('.*')" = "`$1'$($Latest.UpgradeChecksum)'"
            "(^[$]release\s*=\s*)('.*')"         = "`$1'$($Latest.Release)'"
        }
     }
}

function Get-Download($url, $version)
{
    # two levels of redirection
    $request = Invoke-WebRequest -Method Head -Uri $url -MaximumRedirection 0 -ErrorAction Ignore

    $request = Invoke-WebRequest -Method Head -Uri $request.Headers.Location -ErrorAction Ignore -MaximumRedirection 0
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
        $response = Invoke-RestMethod -Uri "https://go.microsoft.com/fwlink/?linkid=2021100"
        $version = $response.component.version

        $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MicrosoftDocs/sql-docs/live/docs/ssms/download-sql-server-management-studio-ssms.md"
        $content = $response.Content

        # The version number for this latest preview is: 13.0.12000.65
        $isMatch = $content -match "([Rr]elease number: (?<release>\d+\.\d+(\.\d+){0,2}))"

        if ($isMatch)
        {
            $release = $matches.release

            Write-Host "Found version $version, release $release"

            $first = Get-Download "https://aka.ms/ssmsfullsetup" $version

            if($first.Count)
            {
                $Latest = @{
                    Version = $version
                    Release = $release
                    FullChecksum = $first.checksum
                    FullUrl = $first.url
                }
                return $Latest

            } else {
                Write-Warning "first.Count and/or second.Count were zero"
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

function global:au_AfterUpdate
{
    # Include version in title
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = Get-Content $nuspecFileName -Raw -Encoding UTF8

    $nu = $nu -replace "(?smi)(\<title\>).*?(\</title\>)", "`${1}SQL Server Management Studio $($Latest.Release)`$2"

    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update -ChecksumFor none