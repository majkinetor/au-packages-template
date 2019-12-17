import-module au

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

            $Latest = @{
                Version = $version
                Release = $release
            }
            return $Latest


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