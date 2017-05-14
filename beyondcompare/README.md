## BeyondCompare Chocolatey Package

This is the code I use to publish the BeyondCompare package to Chocolatey. 

It's actually really easy. 

 1. Follow the instructions on [chocolatey.org](http://chocolatey.org/) to setup Chocolatey
 2. Clone this repository and navigate to the folder in Powershell
 3. `Build.ps1` to create the package
 4. `cinst beyondcompare -Source "full-directory-path"` to install it locally

And you're done!

## BeyondCompare has been updated! Help!

When a new release of BeyondCompare is out in the wild, updating this package is easy:

 1. Fork this repository to your local environment
 2. Run the `.\Update-Version.ps1` to update the package artifacts
 3. Commit the changes to a branch and push it to your fork
 3. Submit a pull request

After I merge the pull request, I'll publish a new release to Chocolatey so they can review it.