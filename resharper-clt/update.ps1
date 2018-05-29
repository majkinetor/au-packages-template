import-module au

function global:au_SearchReplace {
    @{
        'resharper-clt.nuspec' = @{
            "(^.+version=`")(\[.*\])(`".+$)"   = "`$1[$($Latest.MarketingVersion)]`$3"
        }
     }
}

. ..\resharper-platform\common.ps1

function global:au_GetLatest {

    return GetJetbrainsProductLatest
}

update -ChecksumFor none