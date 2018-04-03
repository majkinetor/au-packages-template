$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$installScript = (cat "$toolsDir\setup.iss") -replace 'C:\\Program Files \(x86\)\\',"${env:PROGRAMFILES(X86)}\"

[IO.File]::WriteAllLines("$toolsDir\setup-fixed-instdir.iis", $installScript, (New-Object System.Text.UTF8Encoding $False))

$packageArgs = @{
  packageName            = "$env:chocolateyPackageName"
  FileType               = 'exe'
  SilentArgs             = "/s /sp`"/s /f1`"$toolsDir\setup-fixed-instdir.iis`"`""
  url                    = 'https://its.1c.ru/db/files/1CITS/EXE/TradeWare/1C/1CBarCode/1CBarCode.exe'
  checksum               = '881cd3be8991d471d64ae3bcf2bba70a4536aa533dc946e268534b7ca47f03e4'
  checksumType           = 'sha256'
}
Install-ChocolateyPackage @packageArgs
