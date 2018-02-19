$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileFullPath           = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\UpdSMFJ.exe"
  url                    = 'https://static.roland.com/jp/media/exe/UpdSMFJ.exe'
  checksum               = 'f5d696315286afd4b75b3d384ef671256e254789f22612fae409c1625921481a'
  checksumType           = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
