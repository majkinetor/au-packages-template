import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $versions = [ordered]@{}

    (curl https://dahuawiki.com/Live_Demo).Links.href -match '\.dahuaddns\.com' | % {
        $URL32 = "$_/webplugin.exe"
        Get-ChocolateyWebFile 'dahua-web-plugin' $URL32 -FileFullPath "$env:TMP\webplugin.exe"

        $version = (Get-Item "$env:TMP\webplugin.exe").VersionInfo.ProductVersion.trim()

        $versions[$version] = @{
            URL32   = $URL32
            Version = $version
        } 
    }

    @{Streams = $versions}
}

update
