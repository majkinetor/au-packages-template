~~~
<!-- EDIT ME-->

[![](https://ci.appveyor.com/api/projects/status/github/YOUR_GITHUB_USERNAME_HERE/chocolatey-packages?svg=true)](https://ci.appveyor.com/project/YOUR_GITHUB_USERNAME_HERE/chocolatey-packages)
[Update status](https://gist.github.com/YOUR_GITHUB_USERNAME_HERE/YOUR_GIST_ID_HERE)
[![](http://transparent-favicon.info/favicon.ico)](#)
[chocolatey/YOUR_CHOCOLATEY_USERNAME_HERE](https://chocolatey.org/profiles/YOUR_CHOCOLATEY_USERNAME_HERE)

<!-- EDIT ME-->
<!-- REMOVE THE squiggles "~" surrounding this (this should not be a code block) -->
~~~

## Prerequisites

- Powershell 4+.
- [Chocolatey Automatic Package Updater Module](https://github.com/majkinetor/au): `Install-Module au`

## Create a package

To create a new package see [Creating the package updater script](https://github.com/majkinetor/au#creating-the-package-updater-script).

## Testing the package

In package directory run: `Test-Package`.

## Automatic package update

Run `<package_dir>/update.ps1` from within the directory of the package to update that package. If this script is missing, the package is not automatic.

Run `./update_all.ps1` from the repository root. Edit this script to change the AU [update options](https://github.com/majkinetor/au#updating-all-packages).

You can also call AU method `Update-AUPackages` (alias `updateall`) in the repository root. This will just update each package without any other action.

## How to use with your own packages

To use this system with your own AU packages do the following steps:

* Fork this project and clone it locally.
* Delete all existing packages:  
In the root of the repository run: `ls | ? PSISContainer | ?  Name -notlike '_*' | rm -Recurse`.
* Set your environment variables. See [AU wiki](https://github.com/majkinetor/au/wiki/AppVeyor) for details.
* Add your own packages.  
