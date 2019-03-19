import-module au
Import-Module "$Env:ChocolateyInstall\helpers\chocolateyInstaller.psm1" -Force -Scope Local

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*\`$checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $url = 'https://download.sysinternals.com/files/BGInfo.zip'
   
    $zipfile = "$PSScriptRoot\BGInfo.zip"

    Write-Host "Downloading zip file to find the version"
    $currentProgressPreference = $ProgressPreference
    $ProgressPreference = 'silentlyContinue'
    Invoke-WebRequest $url -OutFile $zipfile
    $ProgressPreference = $currentProgressPreference

    $checksum32 = Get-FileHash $zipfile | ForEach-Object Hash

    $unzipFolder = New-Item -ItemType Directory ([System.IO.Path]::Combine( $env:TEMP, [System.IO.Path]::GetRandomFileName()))
    Get-ChocolateyUnzip -fileFullPath $zipfile -destination $unzipFolder
    $version = Get-ChildItem $unzipFolder -Filter *.exe | ForEach-Object { [System.Diagnostics.FileVersionInfo]::GetVersionInfo($_.FullName).FileVersion } | Select-Object -First 1

    Remove-Item $zipfile -ErrorAction SilentlyContinue
    Remove-Item $unzipFolder -Recurse -Force -ErrorAction SilentlyContinue

    # Just in case they do updates without revving version
    $headers = (Invoke-WebRequest -Uri $url -Method HEAD).Headers
    $lastModified = $headers['Last-Modified'] -as [DateTimeOffset]
    $etag = $headers['ETag']

    $latest = @{
        version = $version
        lastModified = $lastModified
        eTag = $etag
    }

    if (Test-Path current.json) {
        $current = (Get-Content current.json) | ConvertFrom-Json
    } else {
        $current = @{ version = ''; lastModified  = [DateTimeOffset]::MinValue; eTag = '' }
    }

    if ($latest.version -eq $current.version -and ($latest.lastModified -gt $current.lastModified -or $latest.eTag -ne $current.eTag)) {
        Write-Host "Same version but Last-Modified or ETag are different"

        # package fix notation (assuming major.minor existing version)
        $version += ".0." +  [DateTime]::Now.ToString("yyyyMMdd")
        $latest.version = $version
    }
    $json = $latest | ConvertTo-Json -Depth 1
    Set-Content -Path current.json -Value $json

    @{
        Version  = $version
        Checksum32 = $checksum32
    }
}

update -ChecksumFor none