function GetJetbrainsReSharperPlatformLatest {
    # Prefer version from here, rather than from PackageMetadata.Version
    $version = Invoke-RestMethod -Uri "https://download-cf.jetbrains.com/resharper/resharper-version.json"
    $updates = Invoke-RestMethod -Uri "https://download-cf.jetbrains.com/resharper/resharper-updates.json"

    $package = $updates.AllPackages.InstallablePackage | Where-Object { $_.PackageMetadata.Id -eq "JetBrains.ReSharper.src" }
    #$version = $package.PackageMetadata.Version
    $productInfo =  $package.ProductInfo | ConvertFrom-Json

    $versionMarketingString = $productInfo.VersionMarketingString

    $filename = "JetBrains.ReSharperUltimate.$($versionMarketingString).exe"
    ($hashcode, $other) = (Invoke-RestMethod -Uri "https://download.jetbrains.com/resharper/JetBrains.ReSharperUltimate.$($versionMarketingString).exe.sha256") -split " "

    $Latest = @{ 
        Filename = $filename
        Checksum32 = $hashcode
        Version = $version
        MarketingVersion = $versionMarketingString
    }
    return $Latest
}

function GetJetbrainsProductLatest {
    $latest = GetJetbrainsReSharperPlatformLatest

    $latest.PlatformVersion = $latest.Version
    $latest.Version = $latest.MarketingVersion

    return $latest
}
