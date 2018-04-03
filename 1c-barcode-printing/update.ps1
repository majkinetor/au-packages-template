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
	$URL32 = 'https://its.1c.ru/db/files/1CITS/EXE/TradeWare/1C/1CBarCode/1CBarCode.exe'
    Get-ChocolateyWebFile '1c-barcode-printing' "$env:TMP\1CBarCode.exe" $URL32
    Get-ChocolateyUnzip "$env:TMP\1CBarCode.exe" "$env:TMP"
	
	@{
        URL32   = $URL32
        Version = (Get-Item "$env:TMP\1CBarCode\1CBarCode.exe").VersionInfo.ProductVersion.trim()
    }
}

update
