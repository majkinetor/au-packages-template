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

$url = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.11/3proxy-0.8.11.zip'
$urlVista2003 = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.11/3proxy-0.8.11-lite.zip'
$checksum = '2c83da8290afd11313ee22709d6e0c68656b2ac87e421e7ca7e5204fd00b44ac'
$checksumVista2003 = '7f7cdbac89247cf158b3d5f7e67a7c68aaefcf6224f5ec63d91cae6c7263f4ed'

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
  url64bit               = 'https://github.com/z3APA3A/3proxy/releases/download/0.8.11/3proxy-0.8.11-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = $file.checksum
  checksum64             = '9310ba8233ce77d31f27878d11509f1b613edfedbfef735e2cb76c0619705fb4'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
