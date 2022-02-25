# How to Install JC.Unit

When you want to install JC.Unit locally on your machine, you do it via PowerShell. (PowerShell is part of clean Windows operating system installations, so it is not mentioned in prerequisites.) 

You can install JC.Unit with a single line of code. 


## If You Are an Administrator of Your Machine

If anybody user on your machine should be able to use JC.Unit, you need to install it to "AllUsers" scope using the following steps. *(Otherwise you can follow the steps for "non-admins".)*

* Open new PowerShell window. <strong>Important: run it as administrator</strong>

* Run this command:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Install-Module JC.Unit
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This will install the module to C:\Program Files\WindowsPowerShell\Modules\JC.Unit. You can check it is there.



## If you Are NOT an Administrator of Your Machine

* Open new PowerShell window.

* Run this command: 

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Install-Module JC.Unit -Scope CurrentUser
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


-------------

JC.Unit is bundled and distributed as a regular PowerShell module. You can refer to PowerShell documentation for more details, e.g., if you want to do some advanced stuff or you need to troubleshoot:

[https://docs.microsoft.com/en-us/powershell/module/powershellget/install-module?view=powershell-7.2](https://docs.microsoft.com/en-us/powershell/module/powershellget/install-module?view=powershell-7.2)

Select your version of PowerShell in the top left menu in the documentation (you can get it using `$PSVersionTable` command).


## Azure DevOps

In Azure DevOps, you don't need to care about JC.Unit installation. It is part of the Run JC.Unit Tests task. <span class="todo">add link</span>.