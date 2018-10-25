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
	$URL32 = 'https://www.silabs.com/documents/public/software/CP210x_Windows_Drivers.zip'
    Get-ChocolateyWebFile 'cp210x-vcp-drivers' $URL32 -FileFullPath "$env:TMP\CP210x_Windows_Drivers.zip"
	Get-ChocolateyUnzip "$env:TMP\CP210x_Windows_Drivers.zip" "$env:TMP" -SpecificFolder "slabvcp.inf"

	@{
        URL32   = $URL32
        Version = ((cat "$env:TMP\slabvcp.inf") -match '^[ \t]*DriverVer[ \t]*=' -split ',')[1]
    }
}

update
