# Create your first test

In this chapter, we'll guide you step by step how to create your first simple test.
You'll learn how to create a connection to your data, how to write a test and how to run it. 

Because this lesson is an introduction to using JC.Unit, it does not use or
describe many of the options available for this tool.

## Prepare a folder for your test

Create a folder anywhere on your local drive. You will store your test artifacts and results there.

![Empty folder for JC.Unit](Images/media/my-first-tests-empty-folder.jpg)

Now, download two samle files that we prepared for your first test: <a href="SampleFiles/PersonsEmail.xlsx" download>PersonsEmail.xlsx</a> and <a href="SampleFiles/PersonsInfo.xlsx" download>PersonsInfo.xlsx</a>. Place them to the folder you just created. 

> Don't worry, you'll be able to compare anything with anything (e.g. SQL server table with an MS Excel file, ORACLE table with result of DAX query, ...). We'll be comparing two MS Excel sheet in our first test.

Create a subfolder for storing the results of the tests - name it "Test Results".

Last thing you need in the folder is a file with definition of your connections and tests. We prepared it for you: <a href="SampleFiles/TestDefinitions.yaml" download>TestDefinitions.yaml</a>. We'll examine it very soon, be patient.

> Again, don't worry, you'll NOT be forced to store the connections and tests defintions in a YAML file. We chose that option for intro test because it is super easy. You'll have options to store your files in MS Excel files, SQL Server, ORACLE, YAML, ...

Now, your folder should look something like this:

![Folder with tests](Images/media/folder-with-tests.jpg)

## What will we test

We have two sample MS Excel files. We want to compare two specified columns and check, whether the data are the same in both files:

![What is the test about](Images/media/what-is-the-test-about.jpg)

For this to happen, we need to define somewhere two *connections* (one to PersonsEmail.xlsx and one to PersonsInfo.xlsx) and one *test* (that compares the data in the columns of choice).

Now, examine the content of TestDefinitions.yaml file:

![YAML configuration example](Images/media/yaml-definition-example.jpg)

Please note how easy it is to add more connections and more tests. The file in this format is easy to read and easy to maintain (but you will be not forced to use YAML format, there's lot of other options where to define connections and tests).

## Run the test

OK, all is set up, we can run the test and see, whether the columns contain the same data or not.

You have more options, how to run the tests:

* from PowerShell
* using GUI, "JC.Unit Runner"
* in Azure DevOps pipeline

Let's use PowerShell first. You need PowerShell 5 or newer. Run these commands:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Import-Module JC.Unit

Invoke-JcUnitTest `
	-ConnectionDefinitionsProvider Yaml `
	-ConnectionDefinitionsSettings .\TestDefinitions.yaml `
	-TestDefinitionsProvider Yaml `
	-TestDefinitionsSettings .\TestDefinitions.yaml `
	-LogFilesFolder '.\Test Results\' `
	-WorkingDirectory .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![Run JC.Unit tests in PowerShell](/Images/media/run-tests.jpg)

What we say here is, that our connections and tests are defined in a YAML file, where the file is, where we want to store test results and working directory. (Working directory is a path against which all relative paths are resolved.)

TODO: this throws error. I'm not admin, the PS module is trying to create JC.Unit.json file under C:\Program Files\WindowsPowerShell\Modules\JC.Unit folder.

TODO: screenshots of results in console window, screenshots of result files

All of this is automation friendly, but there is also GUI for running the tests, JC.Unit Runner. You can start when you run this from PowerShell window:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Show-JcUnitGUI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can also specify the working folder directly (dot for current folder):

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Show-JcUnitGUI -WorkingFolder .
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TODO: bude runner mít switch pro working folder? Nebo budeme chtít vybrat dll? Jestli bude runner v PowerShellu, může být problém s právama, viz výše.

TODO: ukázat, jak spustit testy v JC.Runneru.

------
------
-------

**Prerequisities**

You will need the following to run the first test:
-   The JC.Unit folder
-   JC.Unit.Runner folder
-   JC.Unit.json file
-   Excel files with data
-   RunTest.ps1 file
-   TestDefinitions.yaml file

All of these files are part of the ['Sample files' folder](https://github.com/cernatery/JC.Tools/tree/main/JC.Unit/Documentation/SampleFiles).

![Folder](Images/media/image4.png)

Make sure you have .NET installed.

## Let\'s do the test

-   **Prepare two Excel files you want to test**

For the first test we chose to compare two excel files with data -
download these two files (PersonsInfo.xlsx & PersonsEmail.xlsx) and save them to the location where you have
the JC.Unit folder. In the Excel files there is data about 100 persons,
and we want to check that both files contain the same people\'s personal
numbers and their emails.

-   **Set content of the TestDefinitions.yaml**

The above example says we use YAML for defining tests and connections.
YAML is a language that is easy to read and easy to use. It is often
used as a format for configuration files.

In our example, tests and connections are defined in the same YAML file
called **TestDefinitions.yaml**.

Feel free to download this file [here](https://github.com/cernatery/JC.Tools/tree/main/JC.Unit/Documentation/SampleFiles).

In the picture below you can see what the basic setup for our first test
looks like. At the top of the file there is a place to define the
connections, at the bottom we will define our test.

![TestDefinitions.yaml](Images/media/image5.png)

### a. Let\'s define the connection

As you can see, in the **Connection section**, we define which two data
systems we want to connect to. We have to set three attributes -
ConnectionName, ConnectionType, ConnectionString.

First we choose **ConnectionName**. ConnectionName is used to
distinguish between different data sources. For the PersonInfo.xlsx file
let\'s choose name \"Info\", for PersonEmail.xlsx choose \"Email\".

For **ConnectionType** we choose ExcelOleDB because we have 2 excel files.

And finally **ConnectionString** - it represents the path to the file.

![Connections in yaml](Images/media/image6.png)

### b. Let\'s define the test

In the **Test section** we define all the attributes of the test - the
TestName, TestQuerySource, TestQuery, ReferenceQuerySource,
ReferenceQuery and TestTypeName.

The **name** of our test is simply \"First Test\", **TestSuite** can be
\"Test\" for exapmle, **TestDescription** is optional.

**TestQuerySource** and **ReferenceQuerySource** are the ConnectionNames
defined in the Connection section above - \"Info\" for PersonsInfo.xlsx
and \"Email\" for \"PersonsEmail.xlsx\".

TestQuery and ReferenceQuery fields contains test queries, in this case
to the Excel files.

We want to know if the data in the PersonalNumber and Email columns
match in both files.Writing a query to Excel file/sheet is not
complicated. In the \"from\" clause, we use the sheet name and in the
end write dollar sign. The name must be in square brackets e.g. select
count(\*) from \[sheet1\$\].

For the **TestTypeName** we choose the \"SameData\" option because we
test whether we have the same number of lines in both files.

![Tests in yaml](Images/media/image7.png)

### c. Setup JC.Unit.json

The last file we need to define is JC.Unit.json - JC.Units
[**configuration file**](https://github.com/joyfulcraftsmen/JC.Tools/tree/main/JC.Unit/Documentation/SampleFiles).

This file tells to JC.Unit where it should look for test definitions and
connection definitions - in this file we configure only two things:

-   Where should JC.Unit look for **definition of tests**.

-   Where should JC.Unit look for **definition of connections** (data sources) that are used in tests.

![Configuration in yaml](Images/media/image8.png)

We have connections and tests defined in the same file -
**TestDefinition.yaml**.

This means that the provider for ConnectionDefinition will be
**YamlConnectionDefinitionProvider** and the provider for TestDefinition
will be **YamlTestDefinitionProvider**.

All providers require **Settings** field - it is a path to the file
containing the definitions, in our case it is a (relative) path to
TestDefinitions.yaml

### Ready to run the test?

#### a.  Running tests via PowerShell command

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

> C:\\Users\\tereza\\Documents\\Testing

![cmd](Images/media/image9.png)

Start command line or PowerShell and navigate to that location:

![cmd](Images/media/image10.png)

Run command:
> dotnet test .\\JC.Unit\\JC.Unit.dll

![RunTest.ps1](Images/media/image11.png)

#### b.  Running tests via JC.Unit.Runner

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

> C:\\Users\\tereza\\Documents\\Testing

Open JC.Unit.Runner.exe from the JC.Unit.Runner folder

![Testing JC.Unit.Runner](Images/media/image12.png)

Now, all you need is to press the **RELOAD TESTS** button and the **RUN
TESTS** button.

![JC.Unit.Runner](Images/media/image13.png)

The result will look like this:

![JC.Unit.Runner Result](Images/media/image14.png)

[Previous chapter](2-0-prerequisites) --- [Next chapter](4-0-how-to-run-test-suite)

[Back to the List of Contents](0-0-list-of-contents)  