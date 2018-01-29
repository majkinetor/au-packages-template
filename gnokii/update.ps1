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
	git clone --depth=1 https://git.savannah.gnu.org/git/gnokii.git
	cd gnokii
	git fetch --depth=1 --tags
	$version = (git tag --sort=-v:refname -l 'rel_*')[0].replace('rel_', '').replace('_', '.')
	$URL32 = "https://gnokii.org/download/gnokii/binaries/win32/gnokii-$version-release-setup.msi"
	
	@{
        URL32   = $URL32
        Version = $version
    }
}

update
