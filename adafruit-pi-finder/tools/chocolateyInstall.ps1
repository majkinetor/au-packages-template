$ErrorActionPreference = 'Stop'

$packageName = 'adafruit-pi-finder'
$url32       = 'https://github.com/adafruit/Adafruit-Pi-Finder/releases/download/3.0.0/PiFinder-3.0.0-win32-ia32.zip'
$url64       = 'https://github.com/adafruit/Adafruit-Pi-Finder/releases/download/3.0.0/PiFinder-3.0.0-win32-x64.zip'
$checksum32  = 'c3ee66c287d4cbde39b0ef431de622723df4c6265387abf06aeb36cefad2eca0'
$checksum64  = 'b8674d6ad27cddfb32f4558a2c06b62a9686c4841417cc097465e37ad4e6890b'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = Split-Path $MyInvocation.MyCommand.Definition
}
Install-ChocolateyZipPackage @packageArgs
