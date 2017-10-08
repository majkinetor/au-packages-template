$ErrorActionPreference = 'Stop';
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Auto-uninstaller mostly does the job - we just have to handle a modal messagebox that appears during uninstall
Start-Process 'AutoHotkey' "$toolsDir\uninstall.ahk"