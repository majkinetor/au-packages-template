# Azure Pipelines Agent Package Parameters

The following package parameters can be set:

* `/Directory:` - Directory to install agent in (defaults to `c:\agent`)
* `/Url:` - URL of the server. For example: `https://myaccount.visualstudio.com` or `http://onprem:8080/tfs`
* `/Token:` - Personal Access Token
* `/Auth:` - One of `negotiate`, `alt` or `integrated`
* `/Username:` - Used with `negotiate` or `alt` - Specify the Windows user name in the format: domain\userName or serName@domain.com
* `/Password:` - Used with `negotiate` or `alt`
* `/Pool:` - Pool name for the agent to join (defaults to `default`)
* `/DeploymentGroup` - Install as deployment agent (instead of a build agent)
* `/Environment` - Install as an environment virtual machine (instead of a build agent)
* `/ProjectName:` - Used with /DeploymentGroup or /Environment. Team project name
* `/CollectionName:` - Used with /DeploymentGroup. Collection name
* `/DeploymentGroupName:` - Used with /DeploymentGroup. Deployment group for the agent to join
* `/DeploymentGroupTags:` - Used with /DeploymentGroup. A comma separated list of tags for the deployment group agent. or example "web, db".
* `/EnvironmentName` - Used with /Environment. Name of the environment to add the VM/machine as a resource to.
* `/EnvironmentTags:` - Used with /Environment. A comma separated list of tags for the environment resource. For example web, db".
* `/AutoLogon` - Configure auto logon and run the agent on startup (The default if this is not specified, is to run the gent as a Windows Service)
* `/LogonAccount:` - Account that agent should run as (either Windows Service or auto logon) - Specify the Windows user ame in the format: domain\userName or userName@domain.com. To log in as Local System, use "NT AUTHORITY\SYSTEM". efaults to NetworkService if not specified.
* `/LogonPassword:` - Used with /LogonAccount. Windows logon password
* `/Work:WorkDirectory` - Work directory where job data is stored. Defaults to _work under the root of the agent irectory. The work directory is owned by a given agent and should not share between multiple agents.
* `/AgentName:Custom_Name` - Custom agent name (defaults to hostname)
* `/Replace` - Replace already registered agent with same name
* `/SslSkipCertValidation` - Ignore SSL server certificate validation errors
* `/GitUseSChannel` - Enable git to use SChannel
* `/UseClientCertificate` - Require all incoming requests to TFS to present a client certificate in addition to the egular credential. Check the documentation for all the requirements.
* `/SslCaCert` - Used with /UseClientCertificate. CA certificate(s) in `.pem` format
* `/SslClientCert` - Used with /UseClientCertificate. Client certificate in `.pem` format
* `/SslClientCertKey` - Used with /UseClientCertificate. Client certificate private key in `.pem` format
* `/SslClientCertArchive` - Used with /UseClientCertificate. Client certificate archive package in `.pfx` format
* `/SslClientCertPassword` - Used with /UseClientCertificate. Password that was used to protected both the Client ertificate private key and Client certificate archive package
* `/ProxyUrl` - Url of your proxy. For example http://proxy.domain.com:port. This adds --proxyurl parameter to onfiguration
* `/ProxyUserName` - Used with /ProxyUrl. Username for proxy. For example domain\username. This adds --proxyusername arameter to configuration
* `/ProxyPassword` - Used with /ProxyUserName. Password for proxy. For example MySecurePass. This adds --proxypassword arameter to configuration
o pass parameters, use `--params "''"` (e.g. `choco install packageID [other options] --params="'/ITEM:value /ITEM2:value2 /FLAG_BOOLEAN'"`).
To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

Examples:

`choco install azure-pipelines-agent --params "'/Directory:c:\agent2 /Token:mytoken /Pool:Integration /Url:https://dev.azure.com/orgname'"`
  