$urls = @{
    "Release" = @{
        Version = "https://download-cf.jetbrains.com/resharper/resharper-version.json"
        Updates = "https://download-cf.jetbrains.com/resharper/resharper-updates.json"
        Hash = "https://download.jetbrains.com/resharper/ReSharperUltimate.VERSIONMARKETINGSTRING/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.exe.sha256"

        # https://download.jetbrains.com/resharper/ReSharperUltimate.2018.2/JetBrains.ReSharperUltimate.2018.2.exe.sha256
        # https://download.jetbrains.com/resharper/ReSharperUltimate.2018.2/JetBrains.ReSharperUltimate.2018.2.exe
        # https://download-cf.jetbrains.com/resharper/ReSharperUltimate.2018.2/JetBrains.ReSharperUltimate.2018.2.exe

        Url = "https://download.jetbrains.com/resharper/ReSharperUltimate.VERSIONMARKETINGSTRING/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.exe"
    }
    "Release-EAP" = @{
        Version = "https://download.jetbrains.com/resharper/resharper-version-eap.json"
        Updates = "https://download.jetbrains.com/resharper/resharper-updates-eap.json"
        Hash = "https://download.jetbrains.com/resharper/ReSharperUltimate.VERSIONMARKETINGSTRING/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.Checked.exe.sha256"
        Url = "https://download.jetbrains.com/resharper/ReSharperUltimate.VERSIONMARKETINGSTRING/JetBrains.ReSharperUltimate.VERSIONMARKETINGSTRING.Checked.exe"
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
    $data = Invoke-RestMethod -Uri $url
    ($hashcode, $filename) = $data -split "\s\*" #.Split(([string[]] ," *"), [System.StringSplitOptions]::RemoveEmptyEntries)

    $url = $urls[$release].Url -replace "VERSIONMARKETINGSTRING", $versionMarketingStringDotted

    $Latest = @{
        Filename = $filename.Trim()
        Checksum32 = $hashcode
        Version = $version
        MarketingVersion = $versionMarketingStringSemVer
        VersionMarketingStringDotted = $versionMarketingStringDotted
        Url32 = $url
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
