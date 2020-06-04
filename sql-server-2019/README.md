# Description

Whether your data is structured or unstructured, query and analyze it using the data platform with industry-leading performance and security.

### What you'll love about SQL Server 2019

#### Analyze every type of data

Gain insights from all your data by querying across relational, non-relational, structured, and unstructured data, for a complete picture of your business using SQL Server 2019 with Apache Spark built in.

#### Choose your language and platform

Get the flexibility to use the language and platform of your choice with open source support. Run SQL Server on Linux containers with Kubernetes support or on Windows.

#### Rely on industry-leading performance

Take advantage of breakthrough scalability and performance to improve the stability and response time of your database—without making app changes. Get high availability for mission-critical applications, data warehouses, and data lakes.

#### Trust nine years of proven security leadership

Achieve your security and compliance goals using the database rated as least vulnerable over the last nine years. Stay a step ahead using built-in features for data classification, data protection, and monitoring and alerts [1].

#### Make faster, better decisions

Turn data into answers using the enterprise reporting capabilities of SQL Server Reporting Services along with the included Power BI Report Server, which gives your users access to rich, interactive Power BI reports on any device.

### Operating System requirements for SQL Server Developer

- Windows 10 TH1 1507 or greater
- Windows Server 2016 or greater

### Package Specific

#### Package notes

This package will install SQL Server 2019 Developer Edition using an existing .iso file. If a path to an existing .iso is not supplied, it downloads the same .iso that can be obtained from the [SQL Server Basic Installer](https://go.microsoft.com/fwlink/?linkid=853016)'s *Download Media* menu.

The initial release of this package is focused on installing and uninstalling a default instance of SQL Server 2019 Developer Edition.

Future plans include better support for non-default instances (including uninstalling).

Note that the install script makes use of `Mount-DiskImage` as the minimum OS requirements for SQL Server include this cmdlet.

#### Package Parameters

The following package parameters can be set:

- `/IsoPath:` - path to a local copy of the .iso file - if not supplied then .iso is downloaded
- `/IgnorePendingReboot` - don't check for pending reboot (Warning, SQL Server installation may fail if reboots are pending)

All other package parameters are passed through to SQL Server Setup, allowing you to customise the installation as necessary.

The following are set by default:

- `/ConfigurationFile:` - The path to a configurationfile.ini - defaults to the supplied tools\configurationfile.ini
- `/SQLSYSADMINACCOUNTS:` - The usernames to add to the SQL SysAdmin role - defaults to current user

See https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt#Install for the full list of parameters supported by SQL Server.

To pass parameters, use `--params "''"` (e.g. `choco install sql-server-2019 [other options] --params="'/ITEM:value /ITEM2:value2'"`).

Example using /IsoPath to use previously downloaded SQL Server .iso

```powershell
choco install sql-server-2019 --params="'/IsoPath:c:\downloads\SQLServer2019-x64-ENU-Dev.iso'"
```

#### Chocolatey Pro / Business users

If you allow the package to download the ISO file, it is suggested you run Chocolatey with the `--skip-virus-check` parameter, as the online virus scanner doesn't handle files over 500MB. You should use alternate methods of scanning in this case.
