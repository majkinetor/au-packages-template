$ErrorActionPreference = 'Stop';

$extensionId = "6c84f75d-38c3-48a2-9e54-d362238686b5"

. $toolsDir\common.ps1

# Be explicit about VS instances, otherwise uninstalling can affect older versions besides 2017
& $vsixInstaller /uninstall:$extensionId /instanceIds:$vsInstances /logfile:`"$env:TEMP\$($packageName)\$($packageName).VsixUninstall.log`" /quiet