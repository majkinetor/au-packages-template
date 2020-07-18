import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.Url32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

. ..\resharper-platform\common.ps1

function global:au_GetLatest {
    $latest = GetJetbrainsProductLatest

    ######
    $stream = $latest.Streams['Release']
    # https://download.jetbrains.com/resharper/JetBrains.ReSharper.CommandLineTools.2018.1.1.zip.sha256
    $versionMarketingStringDotted = $stream.VersionMarketingStringDotted
    $url = "https://download.jetbrains.com/resharper/ReSharperUltimate.$versionMarketingStringDotted/JetBrains.ReSharper.CommandLineTools.$versionMarketingStringDotted.zip.sha256"
    ($hashcode, $filename) = (Invoke-RestMethod -Uri $url).Split(([string[]] ," *"), [System.StringSplitOptions]::RemoveEmptyEntries)

    $stream.Checksum32 = $hashcode
    $stream.Url32 = "https://download.jetbrains.com/resharper/ReSharperUltimate.$versionMarketingStringDotted/JetBrains.ReSharper.CommandLineTools.$versionMarketingStringDotted.zip"

    # https://download.jetbrains.com/resharper/dotUltimate.2020.2.EAP7/JetBrains.ReSharper.CommandLineTools.2020.2.EAP7.Checked.zip
    $stream = $latest.Streams['Release-Eap']
    $versionMarketingStringDotted = $stream.VersionMarketingStringDotted
    $url = "https://download.jetbrains.com/resharper/dotUltimate.$versionMarketingStringDotted/JetBrains.ReSharper.CommandLineTools.$versionMarketingStringDotted.Checked.zip.sha256"
    ($hashcode, $filename) = (Invoke-RestMethod -Uri $url).Split(([string[]] ," *"), [System.StringSplitOptions]::RemoveEmptyEntries)

    $stream.Checksum32 = $hashcode
    # https://download.jetbrains.com/resharper/dotUltimate.2020.2.EAP7/JetBrains.ReSharper.CommandLineTools.2020.2.EAP7.Checked.zip.sha256
    $stream.Url32 = "https://download.jetbrains.com/resharper/dotUltimate.$versionMarketingStringDotted/JetBrains.ReSharper.CommandLineTools.$versionMarketingStringDotted.Checked.zip"

    return $latest
}

update -ChecksumFor none