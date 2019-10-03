$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  url                    = 'https://airspy.com/downloads/sdrsharp-x86.zip'
  url64bit               = 'https://airspy.com/downloads/sdrsharp-x64.zip'
  UnzipLocation          = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
  checksum               = '2ae9f59114472f1d4515f144ae9d57b6004926b917c4eb6297dbb7c4f2ab46eb'
  checksum64             = '39a6c624fde09dd35836d79cf4a87947651715de78dce3bdfe8768781587f51b'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
