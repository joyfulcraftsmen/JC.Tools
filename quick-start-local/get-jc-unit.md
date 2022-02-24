# Get JC.Unit

Installation of JC.Unit is quick and easy. It'll be up and running in less than XXX 
TODO minutes.
TODO: video?

## Prerequisites

JC.Unit is supported only on Windows. You can run it on Windows 10 or newer and on Windows Server 2016 or newer. We also provide a task for Azure DevOps.

TODO: link to documentation for Azure DevOps task, info whether we support on-premise Azure DevOps server.

### .NET Core SDK 6

You need to install .NET core before we start. Download and install **.NET Core SDK** from [this website](https://dotnet.microsoft.com/download).

TODO: is this needed? What about self-contained executable?

TODO: what version of .NET to use?

TODO: is *SDK* needed? We don't rely on dotnet test anymore...
TODO: current screenshot what to download/install

![.NET Core](/Images/media/image1.png)


### Optional: Microsoft Access Database Engine 2016 Redistributable

If you want to query **MS Excel files**, it is possible you can get \'The
\'Microsoft.ACE.OLEDB.16.0\' provider is not registered on the local
machine.\' error message.

In this case it is necessary to install this provider from [this website](https://www.microsoft.com/en-us/download/details.aspx?id=54920).



## Install JC.Unit with one line of code

You can get JC.Unit testing framework with just one line in PowerShell. As simple as that.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Install-Module JC.Unit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![Install JC.Unit using PowerShell](/Images/media/powershell-install-jc-unit.jpg)

If you don't have admin permissions on your machine, you can install the module into your user's scope:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Install-Module JC.Unit -Scope CurrentUser
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

And that's it. Now you have JC.Unit on your machine. Let's create our [first test](create-first-test).






