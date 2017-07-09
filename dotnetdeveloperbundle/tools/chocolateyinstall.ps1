$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = ''

#Based on NO DETECTION IN PRO
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'dotnetdeveloperbundle*'
  fileType      = 'exe'
  silentArgs    = "/IAgreeToTheEULA"
  #OTHERS
  # Uncomment matching EXE type (sorted by most to least common)
  #$silentArgs = '/S'           # NSIS
  #silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  #silentArgs   = '/s'           # InstallShield
  #silentArgs   = '/s /v"/qn"' # InstallShield with MSI
  #silentArgs   = '/s'           # Wise InstallMaster
  #silentArgs   = '-s'           # Squirrel
  #silentArgs   = '-q'           # Install4j
  #silentArgs   = '-s'           # Ghost
  # Note that some installers, in addition to the silentArgs above, may also need assistance of AHK to achieve silence.
  #silentArgs   = ''             # none; make silent with input macro script like AutoHotKey (AHK)
                                 #       https://chocolatey.org/packages/autohotkey.portable
  
  validExitCodes= @(0) #please insert other valid exit codes here
  url           = "https://download.red-gate.com/DotNETDeveloperBundle.exe"  #download URL, HTTPS preferrred
  checksum      = '7B17ACA323642ED5EBDB91F40932F4A253DDC5EF46BD9CD5343A0F99FE27936B'
  checksumType  = 'sha256'
  url64bit      = ""   # 64bit URL here (HTTPS preferred) or remove - if installer contains both architectures (very rare), use $url
  checksum64    = ''
  checksumType64= 'sha256'
  destination   = $toolsDir
}

Install-ChocolateyPackage @packageArgs 

## See https://chocolatey.org/docs/helpers-reference

