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
            Invoke-WebRequest -Uri $url -OutFile $filename
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
        $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MicrosoftDocs/sql-docs/live/docs/ssms/download-sql-server-management-studio-ssms.md"
        $content = $response.Content

        # The version number for this latest preview is: 13.0.12000.65
        $isMatch = $content -match "(The release number: (?<release>\d+\.\d+(\.\d+){0,2}))\s*(The build number for this release).*: (?<version>\d+\.\d+\.\d+\.\d+)"

        if ($isMatch)
        {
            $version = $matches.version
            $release = $matches.release
            
            Write-Host "Found version $version, release $release"
        
            $downloadLinks = $content | Select-String -Pattern "Download SQL Server Management Studio.*\]\((https.*)\)" -AllMatches 

            if ($downloadLinks.Matches.Count -eq 2)
            {
                $first = Get-Download $downloadLinks.Matches[0].Groups[1].Value $version
                $second = Get-Download $downloadLinks.Matches[1].Groups[1].Value $version
         
                if($first.Count -and $second.Count)
                {
                    # release notes
                    $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MicrosoftDocs/sql-docs/live/docs/ssms/sql-server-management-studio-changelog-ssms.md"
                    $content = $response.Content

                    # Extract latest release notes
                    $content = $content.Substring($content.IndexOf("##"))
                    $content = $content.Substring(0, $content.IndexOf("## Previous SSMS releases") -1)

                    # bump headings to fit in with Chocolatey levels
                    $content = $content.Replace("# ", "### ").Trim()

                    # encode 
                    $content = "`r`n" + [System.Security.SecurityElement]::Escape($content) + "`r`n"
            
                    $Latest = @{ 
                        Version = $version
                        Release = $release
                        FullChecksum = $first.checksum
                        FullUrl = $first.url
                        UpgradeUrl = $second.url
                        UpgradeChecksum = $second.checksum
                        ReleaseNotes = $content
                    }
                }
            }
        }
    }
    catch {
        Write-Error $_
    }
    return $Latest
}

function global:au_AfterUpdate
{ 
    $nuspecFileName = $Latest.PackageName + ".nuspec"
    $nu = Get-Content $nuspecFileName -Raw -Encoding UTF8
    $nu = $nu -replace "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)", "`${1}$($Latest.ReleaseNotes)`$2"

    $nu = $nu -replace "(?smi)(\<title\>).*?(\</title\>)", "`${1}SQL Server Management Studio $($Latest.Release)`$2"
    
    $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding($False)
    $NuPath = (Resolve-Path $NuspecFileName)
    [System.IO.File]::WriteAllText($NuPath, $nu, $Utf8NoBomEncoding)
}

update -ChecksumFor none