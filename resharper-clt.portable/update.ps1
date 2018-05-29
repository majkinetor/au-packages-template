import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'https://download.jetbrains.com/resharper/JetBrains.ReSharper.CommandLineTools.$($Latest.MarketingVersion).zip'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

. ..\resharper-platform\common.ps1

function global:au_GetLatest {
    $latest = GetJetbrainsProductLatest

    # https://download.jetbrains.com/resharper/JetBrains.ReSharper.CommandLineTools.2018.1.1.zip.sha256
    ($hashcode, $other) = (Invoke-RestMethod -Uri "https://download.jetbrains.com/resharper/JetBrains.ReSharper.CommandLineTools.$($latest.MarketingVersion).zip.sha256") -split " "

    $latest.Checksum32 = $hashcode
    return $latest
}

update -ChecksumFor none