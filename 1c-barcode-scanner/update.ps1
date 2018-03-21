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
	$URL32 = 'https://its.1c.ru/db/files/1CITS/EXE/TradeWare/1C/ScanOPOS/ScanOPOS.exe'
    Get-ChocolateyWebFile '1c-barcode-scanner' "$env:TMP\1c-barcode-scanner.exe" $URL32
    Get-ChocolateyUnzip "$env:TMP\1c-barcode-scanner.exe" "$env:TMP" -SpecificFolder "ScanOPOS"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\ScanOPOS\ScanOPOS.exe").VersionInfo.ProductVersion.trim()
    }
}

update
