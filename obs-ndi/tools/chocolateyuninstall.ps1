$ErrorActionPreference = 'Stop';

# Would use Uninstall-ChocolateyZipPackage @packageArgs, but for https://github.com/chocolatey/choco/issues/2042

$ZipFileName  = "obs-ndi-4.9.0-Windows.zip"

$zipContentFile=(join-path $env:chocolateyPackageFolder $zipFileName) + "Install.txt"

if(-Not (Test-Path -Path $zipContentFile)) {
  $zipContentFile=(Join-Path $env:chocolateyPackageFolder -ChildPath $zipFileName) + ".txt"
}

if ((Test-Path -path $zipContentFile)) {
  $zipContentFile

  # Sorted so files are done before the directories they belong to
  $zipContents=get-content $zipContentFile | Sort-Object -Descending
  foreach ($fileInZip in $zipContents) {
    if ($fileInZip -ne $null -and $fileInZip.Trim() -ne '') {
      if ((Get-Item $fileInZip).PSIsContainer) {
        # Only delete if directory is empty
        if ((Get-Item $fileInZip).GetFileSystemInfos().Count -eq 0) {
          Remove-Item -Path "$fileInZip" -ErrorAction SilentlyContinue -Force
        } else {
          Write-Verbose "Skipping $fileInZip as it is not empty"
        }
      } else {
        Remove-Item -Path "$fileInZip" -ErrorAction SilentlyContinue -Force
      }
    }
  }
} else {
  Write-Verbose "Couldn't find $zipContentFile"
}
