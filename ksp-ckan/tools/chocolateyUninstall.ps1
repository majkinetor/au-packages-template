$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"
Get-Process ckan -ErrorAction SilentlyContinue | Where-Object {$_.Path -eq $exePath }  | Stop-Process -PassThru

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
If (Test-Path $link) {
    Remove-Item "$link"
}