$ErrorActionPreference = 'Stop';

$extensionId = "6c84f75d-38c3-48a2-9e54-d362238686b5"

$packageArgs = @{
    packageName   = $packageName
    VsixId        = $extensionId
  }

Uninstall-VisualStudioVsixExtension @packageArgs