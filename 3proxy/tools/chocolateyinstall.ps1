# According to https://stackoverflow.com/q/7330187
 
# [System.Environment]::OSVersion.Version
# - does not show [Windows 10 release](https://en.wikipedia.org/wiki/Windows_10_version_history)
# - does not differentiate between Windows 8.1 (6.3.9600) and Windows 8 (6.2.9200)
# - [deprecated](https://blogs.technet.microsoft.com/heyscriptingguy/2014/04/25/use-powershell-to-find-operating-system-version/)
 
# [Environment]::OSVersion is same as previous
 
# Get-WmiObject Win32_OperatingSystem
# - does not show [Windows 10 release](https://en.wikipedia.org/wiki/Windows_10_version_history)
# - [deprecated](https://blogs.technet.microsoft.com/heyscriptingguy/2014/04/25/use-powershell-to-find-operating-system-version/)
 
# Get-CimInstance Win32_OperatingSystem
# - does not show [Windows 10 release](https://en.wikipedia.org/wiki/Windows_10_version_history)
 
# Get-ComputerInfo is PowerShell 5+

$url = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.13/3proxy-0.8.13.zip'
$urlVista2003 = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.13/3proxy-0.8.13-lite.zip'
$checksum = '379ff8fc57083d2bd3ec121edc2358c03dfc77c9fbdbc4fcacd6bb8aa5056272'
$checksumVista2003 = '0271ba50227c76a37fa6062ed79b05e7c7f6fe637cc34a93f8a8ab1061a5b89e'

function getFile{
    $windowsVersion = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
	if ([double]$windowsVersion.CurrentVersion -ge 5.2) {
		return @{url = $url
		checksum = $checksum}
	} else {
		return @{url = $urlVista2003
		checksum = $checksumVista2003}
	}
}

$file = getFile

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = $file.url
  url64bit               = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.13/3proxy-0.8.13-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = $file.checksum
  checksum64             = 'd9b5ff1f39b6377cbd6bee0baa699dc0378dfde228f7240fc62ddc51795a7c94'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
