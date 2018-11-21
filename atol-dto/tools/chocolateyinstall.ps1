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

function getFoldername{
    $windowsVersion = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
	$bitness = Get-ProcessorBits
	if ($bitness -eq 32) {
		$bitness = 86
	}
	if ($windowsVersion.CurrentMajorVersionNumber -ge 10) {
		return "W10_x$bitness"
	} else {
		return "W7W8_x$bitness"
	}
}

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'http://fs.atol.ru/_layouts/15/atol.templates/Handlers/FileHandler.ashx?guid=ee1d197e-8e1e-4c10-948e-ffd2ef9e68e4'
  checksum               = 'b772720a9f355d95ba258a651889966139c6f4ee0cb2870c1a2bd21f8039a0ea'
  checksumType           = 'sha256'
  UnzipLocation          = "$env:TMP"
  SpecificFolder         = '10.4.2\installer\exe'
}
Install-ChocolateyZipPackage @packageArgs

$foldername = getFoldername

$packageArgs = @{
  FileFullPath           = "$env:TMP\10.4.2\installer\exe\KKT10-10.4.2-windows32-setup.exe"
  FileFullPath64         = "$env:TMP\10.4.2\installer\exe\KKT10-10.4.2-windows64-setup.exe"
  Destination            = "$env:TMP"
  SpecificFolder         = "USB_Drivers\$foldername"
}
Get-ChocolateyUnzip @packageArgs

(Get-AuthenticodeSignature "$env:TMP\USB_Drivers\$foldername\atol-usbcom.cat").SignerCertificate | Export-Certificate -FilePath "$env:TMP\atol-usbcom.cer"
 
Import-Certificate -FilePath "$env:TMP\atol-usbcom.cer" -CertStoreLocation Cert:\LocalMachine\TrustedPublisher

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = '/S'
  File                   = "$env:TMP\10.4.2\installer\exe\KKT10-10.4.2-windows32-setup.exe"
  File64                 = "$env:TMP\10.4.2\installer\exe\KKT10-10.4.2-windows64-setup.exe"
}
Install-ChocolateyInstallPackage @packageArgs
