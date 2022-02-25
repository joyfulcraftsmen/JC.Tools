# Prerequisites

Prerequisites depend on whether you plan to use JC.Unit 

* locally on your machine (via Test Runner or PowerShell)
* in Azure DevOps pipeline
* or both.

It is convenient to develop tests locally first, we recommend to use JC.Unit both manually and as automated task.

## Operating System

Supported operating systems:

* Windows 10 or newer

* Windows Server 2016 or newer.

### Azure DevOps Note

Because, as mentioned above, JC.Unit supports only MS Windows operating system, you must reflect this when you specify demands for the agent. If you use self-hosted agent, it must run on MS Windows. If you use Microsoft-hosted agent, specify any of these pools (or newer once they becomoe available):

* windows-2019
* windows-2022
* windows-latest

Mac / Ubuntu pools are not supported.

## .NET

JC.Unit is based on [.NET](https://dotnet.microsoft.com/en-us/) - a free, cross-platform, open source platform (not .NET Framework). Still, for various reason, we support JC.Unit on Windows only. Support for other platforms may be added in the future, if this will be required by users.

<span class="todo">Add information about required preinstalled .NET version (SDK, non-SDK, ...)</span>


## Drivers

Some connection types require additional drivers to be installed. So far, only one is needed (and also recommended) - OLEDB driver by Microsoft. Having this one installed, you'll be able to run advanced SQL queries against MS Excel worksheets.

If you want to query **MS Excel files** with [ExcelOleDB connector](/JC.Tools/reference/connectors/excel-oledb), you will get "The 'Microsoft.ACE.OLEDB.16.0\' provider is not registered on the local machine." error message, if this driver is not installed.

In this case it is necessary to install "Microsoft Access Database Engine 2016 Redistributable" provider from [this website](https://www.microsoft.com/en-us/download/details.aspx?id=54920).

![Microsoft.ACE.OLEDB.16.0](/Images/media/access-oledb.jpg)

Be sure to install correct version. We expect you use 64 bit (32 bit version was not tested).

![Microsoft.ACE.OLEDB.16.0](/Images/media/accessdatabaseengine_x64.jpg)

Without this driver, you'll still be able to use JC.Unit. You'll just not be able to use [ExcelOleDB Connector](/JC.Tools/reference/connectors/excel-oledb). You'll still be able to use [Excel Connector](/JC.Tools/reference/connectors/excel).

If you want to use [ExcelOleDB Connector](/JC.Tools/reference/connectors/excel-oledb) in Azure DevOps pipeline, you have to install it in a task that is executed prior the *JC.Unit Run Tests task* <span class="todo">add link</span>.