$urls = @{
    "Release" = @{
        Version = "https://download-cf.jetbrains.com/resharper/resharper-version.json"
        Updates = "https://download-cf.jetbrains.com/resharper/resharper-updates.json"
        Hash = "https://download.jetbrains.com/resharper/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.exe.sha256"
    }
    "Release-EAP" = @{
        Version = "https://download.jetbrains.com/resharper/resharper-version-eap.json"
        Updates = "https://download.jetbrains.com/resharper/resharper-updates-eap.json"
        Hash = "https://download.jetbrains.com/resharper/ReSharperUltimate.VERSIONMARKETINGSTRING/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.Checked.exe.sha256"
    }
}

function GetJetbrainsReSharperPlatformLatestRelease($release) {
    # Prefer version from here, rather than from PackageMetadata.Version
    $version = Invoke-RestMethod -Uri ($urls[$release].Version) # "https://download-cf.jetbrains.com/resharper/resharper-version.json"
    $updates = Invoke-RestMethod -Uri ($urls[$release].Updates) #"https://download-cf.jetbrains.com/resharper/resharper-updates.json"

    $package = $updates.AllPackages.InstallablePackage | Where-Object { $_.PackageMetadata.Id -eq "JetBrains.ReSharper.src" }
    $productInfo =  $package.ProductInfo | ConvertFrom-Json

    $versionMarketingString = $productInfo.VersionMarketingString
    $versionMarketingStringSemVer = $versionMarketingString -replace " EAP ", "-EAP"
    $versionMarketingStringDotted = $versionMarketingString -replace " EAP ", ".EAP"

    #$filename = "JetBrains.ReSharperUltimate.$($versionMarketingStringUpdated).exe"
    $url = $urls[$release].Hash -replace "VERSIONMARKETINGSTRING", $versionMarketingStringDotted
    ($hashcode, $filename) = (Invoke-RestMethod -Uri $url).Split(([string[]] ," *"), [System.StringSplitOptions]::RemoveEmptyEntries)

    $Latest = @{
        Filename = $filename.Trim()
        Checksum32 = $hashcode
        Version = $version
        MarketingVersion = $versionMarketingStringSemVer
        VersionMarketingStringDotted = $versionMarketingStringDotted
    }
    return $Latest
}

function GetJetbrainsReSharperPlatformLatest {
    $Latest = @{
        Streams = [ordered] @{
            "Release" = (GetJetbrainsReSharperPlatformLatestRelease "Release")

            "Release-Eap" = (GetJetbrainsReSharperPlatformLatestRelease "Release-EAP")
        }
    }

    return $Latest
}

function GetJetbrainsProductLatest {
    $latest = GetJetbrainsReSharperPlatformLatest

    $streams = $latest.Streams
    foreach ($key in $streams.Keys) {
        $streams[$key].PlatformVersion = $streams[$key].Version
        $streams[$key].Version = $streams[$key].MarketingVersion
    }

    return $latest
}
