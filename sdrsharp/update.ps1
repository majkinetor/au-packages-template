import-module au
import-module $env:ChocolateyInstall\helpers\chocolateyInstaller.psm1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
	$URL32 = 'https://airspy.com/downloads/sdrsharp-x86.zip'
	$URL64 = 'https://airspy.com/downloads/sdrsharp-x64.zip'
    Get-ChocolateyWebFile 'sdrsharp' "$env:TMP\sdrsharp-x86.zip" $URL32
    Get-ChocolateyUnzip "$env:TMP\sdrsharp-x86.zip" "$env:TMP" -SpecificFolder "SDRSharp.exe"
	
	@{
	    URL32 = $URL32
		URL64 = $URL64
        Version = (Get-Item "$env:TMP\SDRSharp.exe").VersionInfo.ProductVersion.trim()
    }
}

update
