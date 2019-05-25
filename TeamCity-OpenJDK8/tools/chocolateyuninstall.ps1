$optionsFile = (Join-Path $PSScriptRoot 'options.xml')

if (!(Test-Path $optionsFile)) {
  throw 'Install options file missing. Could not uninstall.'
}

$options = Import-CliXml -Path $optionsFile

Remove-Item (Join-Path $options['unzipLocation'] 'TeamCity') -Recurse -Force