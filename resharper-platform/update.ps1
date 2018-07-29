import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]filename\s*=\s*)('.*')"      = "`$1'$($Latest.Filename)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)(['`"].*['`"])"      = "`$1'$($Latest.Url32)'"
        }
        'resharper-platform.nuspec' = @{
            "(\<title\>).*?(\</title\>)" = "`${1}JetBrains ReSharper Ultimate Platform Installer $($Latest.MarketingVersion)`$2"
        }        
     }
}

. .\common.ps1

function global:au_GetLatest {
    return GetJetbrainsReSharperPlatformLatest
}

update -ChecksumFor none