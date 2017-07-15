[![](https://ci.appveyor.com/api/projects/status/github/flcdrg/au-packages?svg=true)](https://ci.appveyor.com/project/flcdrg/au-packages)
[Update status](https://gist.github.com/flcdrg/7d00c69c2cde8309a8594abaa897a9a6)
[![](http://transparent-favicon.info/favicon.ico)](#)
[chocolatey/flcdrg](https://chocolatey.org/profiles/flcdrg)

This repository contains [chocolatey automatic packages](https://chocolatey.org/docs/automatic-packages).  
The repository is setup so that you can manage your packages entirely from the GitHub web interface (using AppVeyor to update and push packages) and/or using the local repository copy.

## Prerequisites

To run locally you will need:

- Powershell 5+: `cinst powershell`
- [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au): `Install-Module au` or `cinst au`

## Create a package

To create a new package see [Creating the package updater script](https://github.com/majkinetor/au#creating-the-package-updater-script).

## Testing the package

In a package directory run: `Test-Package`. This function can be used to start testing in [chocolatey-test-environment](https://github.com/majkinetor/chocolatey-test-environment) via `Vagrant` parameter or it can test packages locally.


## Automatic package update

### Single package

Run from within the directory of the package to update that package:
   
    cd <package_dir>
    ./update.ps1

If this script is missing, the package is not automatic.  
Set `$au_Force = $true` prior to script call to update the package even if no new version is found.

### Multiple packages

To update all packages run `./update_all.ps1`. It accepts few options:

```powershell
./update_all.ps1 -Name a*                         # Update all packages which name start with letter 'a'
./update_all.ps1 -ForcedPackages 'cpu-z copyq'    # Update all packages and force cpu-z and copyq
./update_all.ps1 -ForcedPackages 'copyq:1.2.3'    # Update all packages but force copyq with explicit version
./update_all.ps1 -Root 'c:\packages'              # Update all packages in the c:\packages folder
```

The following global variables influence the execution of `update_all.ps1` script if set prior to the call:

```powershell
$au_NoPlugins = $true        #Do not execute plugins
$au_Push      = $false       #Do not push to chocolatey
```

You can also call AU method `Update-AUPackages` (alias `updateall`) on its own in the repository root. This will just run the updater for the each package without any other option from `update_all.ps1` script. For example to force update of all packages with a single command execute:

    updateall -Options ([ordered]@{ Force = $true })

To quickly test if all of the packages update force all with `test_all.ps1` script:

```
master~> .\test_all.ps1
Updating 4 automatic packages at 2017-04-30 10:54:34 (forced)
Push is disabled
FORCE IS ENABLED. All packages will be updated
   less is updated to 4.87.0.20170430
   copyq is updated to 3.0.0.20170430
   librecad is updated to 2.1.3.20170430
   prey is updated to 1.6.6.20170430
``` 

## Pushing To Community Repository Via Commit Message

You can force package update and push using git commit message. AppVeyor build is set up to pass arguments from the commit message to the `./update_all.ps1` script.

If commit message includes `[AU <forced_packages>]` message on the first line, the `forced_packages` string will be sent to the updater.

Examples:
- `[AU pkg1 pkg2]`  
Force update ONLY packages `pkg1` and `pkg2`.
- `[AU pkg1:ver1 pkg2 non_existent]`  
Force `pkg1` and use explicit version `ver1`, force `pkg2` and ignore `non_existent`.

To see how versions behave when package update is forced see the [force documentation](https://github.com/majkinetor/au/blob/master/README.md#force-update).

You can also push manual packages with command `[PUSH pkg1 ... pkgN]`. This works for any package anywhere in the file hierarchy and will not invoke AU updater at all. 

If there are no changes in the repository use `--allow-empty` git parameter:

    git commit -m '[AU copyq less:2.0]' --allow-empty
    git push

## Start using AU with your own packages

To use this system with your own packages do the following steps:

* Fork this project. If needed, rename it to `au-packages`.
* Delete all existing packages.
* Edit the `README.md` header with your repository info.
* Set your environment variables. See [AU wiki](https://github.com/majkinetor/au/wiki#environment-variables) for details.

Add your own packages now, with this in mind:
* You can keep both manual and automatic packages together. To get only AU packages any time use `Get-AUPackages` function (alias `lsau` or `gau`)
* Keep all package additional files in the package directory (icons, screenshots etc.). This keeps everything related to one package in its own directory so it is easy to move it around or remove it.
