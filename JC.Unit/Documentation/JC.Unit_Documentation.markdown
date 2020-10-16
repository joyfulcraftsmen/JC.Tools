# JC.Unit Documentation

## Getting started

### About JC.Unit

JC.Unit is a framework for testing BI solutions. It is supporting
multiple platforms such as MS SQL, Excel, Oracle, PostgreSQL. Its scope
includes relational databases, olap/cubes databases, etc.

The main goal of this framework is to let users create tests easily and
test their data - JC.Unit has a very simple configuration.

### Prerequisites for running tests from Command line

1.  .NET Core SDK 3.1

You need to install .Net core before we start. We will then run the
tests using the PowerShell command.

**-\> Supported version of .NET is .NET Core 3.1**

Download and install **.NET Core SDK** from [this website](https://dotnet.microsoft.com/download).

![.NET Core](Images/media/image1.png)

2.  Microsoft Access Database Engine 2010 Redistributable

If you want to query the **excel files**, it is possible you got \'The
\'Microsoft.ACE.OLEDB.16.0\' provider is not registered on the local
machine.\' error message.

In this case it is necessary to install this provider from [this website](https://www.microsoft.com/en-us/download/details.aspx?id=54920).

![Provider](Images/media/image2.png)

## Set your first test

This chapter shows you how to run the first test - how to create a
Connection to the data set, how to write a test and then run it. Because
this lesson is an introduction to using JC.Unit, it does not use or
describe many of the options available for this tool.

**Prerequisities**

You will need the following to run the first test:
-   The JC.Unit folder
-   JC.Unit.Runner folder
-   JC.Unit.json file
-   Excel files with data
-   RunTest.ps1 file
-   TestDefinitions.yaml file

All of these files are part of the JC.Unit StarterPack folder (all these
files are also contained in this documentation on this page below).

![Folder](Images/media/image4.png)

Make sure you have .NET installed.

### Let\'s do the test

-   **Prepare two Excel files you want to test**

For the first test we chose to compare two excel files with data -
download these two files and save them to the location where you have
the JC.Unit folder. In the Excel files there is data about 100 persons,
and we want to check that both files contain the same people\'s personal
numbers and their emails.

\<\<PersonsInfo.xlsx\>\>

\<\<PersonsEmail.xlsx\>\>

-   **Set content of the TestDefinitions.yaml**

The above example says we use YAML for defining tests and connections.
YAML is a language that is easy to read and easy to use. It is often
used as a format for configuration files.

In our example, tests and connections are defined in the same YAML file
called **TestDefinitions.yaml**.

Feel free to download this file here:

\<\<TestDefinitions.yaml\>\>

In the picture below you can see what the basic setup for our first test
looks like. At the top of the file there is a place to define the
connections, at the bottom we will define our test.

![TestDefinitions.yaml](Images/media/image5.png)

#### a. Let\'s define the connection

As you can see, in the **Connection section**, we define which two data
systems we want to connect to. We have to set three attributes -
ConnectionName, ConnectionType, ConnectionString.

First we choose **ConnectionName**. ConnectionName is used to
distinguish between different data sources. For the PersonInfo.xlsx file
let\'s choose name \"Info\", for PersonEmail.xlsx choose \"Email\".

For **ConnectionType** we choose ExcelOleDB because we have 2 excel files.

And finally **ConnectionString** - it represents the path to the file.

![Connections in yaml](Images/media/image6.png)

#### b. Let\'s define the test

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

#### c. Setup JC.Unit.json

The last file we need to define is JC.Unit.json - JC.Units
**configuration file**.

\<\<JC.Unit.json\>\>

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

#### Ready to run the test?

a.  **Running tests via PowerShell command**

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

> C:\\Users\\tereza\\Documents\\Testing

![cmd](Images/media/image9.png)

Start command line or PowerShell and navigate to that location:

![cmd](Images/media/image10.png)

Run command:
> dotnet test .\\JC.Unit\\JC.Unit.dll

\<\<RunTest.ps1\>\>

![RunTest.ps1](Images/media/image11.png)

b.  **Running tests via JC.Unit.Runner**

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

C:\\Users\\tereza\\Documents\\Testing

Open JC.Unit.Runner.exe from the JC.Unit.Runner folder

![Testing JC.Unit.Runner](Images/media/image12.png)

Now, all you need is to press the **RELOAD TESTS** button and the **RUN
TESTS** button.

![JC.Unit.Runner](Images/media/image13.png)

The result will look like this:

![JC.Unit.Runner Result](Images/media/image14.png)

## Options for running the tests

### How to run test-suite locally in Command line

Testers usually need to run their tests locally on their client
machines, not only from Azure DevOps or TFS pipelines.

It speeds up test development and lots of things can be checked before
running build a pipeline.

**Prerequisities**

Make sure you have .NET installed.

**How to run tests**

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

> C:\\Users\\tereza\\Documents\\Testing

![Path to the JC.Unit file](Images/media/image9.png)

Start command line or PowerShell and navigate to that location:

![cmd](Images/media/image10.png)

Run command:
> dotnet test .\\JC.Unit\\JC.Unit.dll

![cmd](Images/media/image11.png)

Basically, you can run the command from anywhere, if you provide correct
path to the JC.Unit.dll file.

**Other options for running JC.Unit in cmd:**

-   Tests execution & Creating a TestResults folder with test results in .trx format in the directory from which we run JC.Unit, just run the following command:

> dotnet test .\\JC.Unit\\JC.Unit.dll /logger:trx

![result logs](Images/media/image15.png)

-   Tests execution & Creating a file folder in .trx format in a directory that we choose

> dotnet test .\\JC.Unit\\JC.Unit.dll /logger:trx /ResultsDirectory:C:\\Users\\TerezaČerná\\Documents\\Projects\\Testing

### How to run test-suite locally using JC.Unit.Runner

Testers usually need to run their tests locally on their client
machines, not only from Azure DevOps or TFS pipelines.

It speeds up test development and lots of things can be checked before
running build a pipeline.

**Prerequisities**

Make sure you have .NET installed.

**How to run tests**

Let\'s say I have JC.Unit binaries and JC.Unit.json file in this
location:

C:\\Users\\tereza\\Documents\\Testing

Open JC.Unit.Runner.exe from the JC.Unit.Runner folder

![JC.Unit.Runner Name](Images/media/image12.png)

Now, all you need is to press the **RELOAD TESTS** button and the **RUN
TESTS** button.

![Reload tests](Images/media/image13.png)

The result will look like this:

![JC.Unit results](Images/media/image14.png)

### How to run test-suite in the pipeline

We have a custom AzureDevops extension with JC.Unit custom task. You can
use it in any pipeline in JC tenant.

If you want to use it in other organizations DevOps pipelines, the
extension needs to be first **shared by JC**.

To use the extension, you need to add 2 tasks:
-   JC.Unit Run Tests task
-   Publish Test Results task

**Important note:** The JC.Unit Run Tests task requires that the .NET
Core SDK 3.1 be installed on the server on which the agent is running
before executing the test.

JC.Unit Run Tests task example:

![JC.Unit Run Tests task example](Images/media/image16.png)

Use the (i) icons (hover over it), it contains useful help messages.

The JC.Unit Run Tests tasks only runs tests, but does not publish its
results to the pipeline, this needs to be done in a separate task:

![Pipeline](Images/media/image17.png)

Make sure you selected \"VSTdest\" and provided \"\*\*/\*.trx\" values,
as on the picture. These are not default values. Usually you will also
want to fail the pipeline if tests fail, check \"Fail if there are test
failures\".

## How to setup the JC.Unit.json file

JC.Unit.json is a json file that stores the paths to the **connections**
and **tests** you wrote. It is a JC.Units **configuration file**. In
this subchapter we will explain the details.

Two parts must be configured in the JC.Unit.json file:

-   A \"ConnectionDefinitions\" part: It tells JC.Unit where should look for **definitions of connections** (data sources) that are used in tests.
-   A \"TestDefinitions\" part: Where should JC.Unit look for **definitions of tests**.
-   A \"MaximumErrorCount\" part (optional):

![MaximumErrorCount](Images/media/image18.png)

The number of rows that appear in the error message if an error occurs.

MaximumErrorCount = 1, ends on the first error.
MaximumErrorCount = 0 means that it does not end, even goes through both
datasets and finds all the differences (the test execution may took a
lot of time).
MaximumErrorCount = 9 means that it will end after nine differences,
even if more are needed. Of course, if there are fewer of them, they
will end.

\<\<JC.Unit.json\>\>

**An important note:**

JC.Unit looks for the file in the folder one level above the
JC.Unit.dll. It is possible to easily replace the entire content of
JC.Unit folder (you can use different name) with a newer version,
without losing configuration file.

![Folder structure](Images/media/image19.png)

A.  **\"ConnectionDefinitions\"** part

The \"**Provider**\" field specifies the format in which the ConnectionDefinition file is saved - it tells JC.Unit what type of file should look for.

Supported providers for connections:

  |**Name of the Provider**                | **Description**|
  |----------------------------------------|----------------------------------------------------------------------------------------------------|
  |ExcelConnectionDefinitionProvider       | Used for Connections stored in Excel file.|
  |ExcelOleDBConnectionDefinitionProvider  | Used for Connections saved in Excel file (requires Access database engine driver to be installed).|
  |SqlServerConnectionDefinitionProvider   | Used for Connections stored in the MS SQL database.|
  |YamlConnectionDefinitionProvider        | Used for Connections stored in YAML file.|

It is important to keep names convention e.g. \"ExcelConnectionDefinitionProvider\"

All providers require \"**Settings\"** field. For excel, excel OleDB and YAML, it is a path to the file containing the definitions.

> \"Settings\": \"..\\Tests.xlsx\"

SqlServer provider requires a connection string in the Settings field:

> \"Settings\": \"Data source=SomeServer;integrated security=true;initial catalog=MyDatabase\"

B.  **\"TestDefinitions\"** part

The \"**Provider**\" field specifies the format in which the TestDefinition file is saved - it tells JC.Unit what type of file should look for.

Supported providers for Tests are the same as for Connections:

  |**Name of the Provider**          | **Description**|
  |----------------------------------|----------------------------------------------------------------------------------------------------|
  |ExcelTestDefinitionProvider       | Used for Connections stored in Excel file.
  |ExcelOleDBTestDefinitionProvider  | Used for Connections saved in Excel file (requires Access database engine driver to be installed).|
  |SqlServerTestDefinitionProvider   | Used for Connections stored in the MS SQL database.|
  |YamlTestDefinitionProvider        | Used for Connections stored in YAML file.|

It is important to keep names convention e.g. \"ExcelTestDefinitionProvider\"

As with Connections, the Test requires a Settings field.

**Examples:**

-   **SqlServerConnectionDefinitionProvider** and **SqlServerTestDefinitionProvider** in JC.Unit.json file

![json](Images/media/image20.png)

-   **ExcelOleDBConnectionDefinitionProvider** and **ExcelOleDBTestDefinitionProvider** in JC.Unit.json file

![json](Images/media/image21.png)

-   **YamlConnectionDefinitionProvider** and **YamlTestDefinitionProvider** in JC.Unit.json file

![json](Images/media/image22.png)
 
## Connection Definitions

### How to define a connection

Connections are used to connect to the data you want to test. In this
subchapter we will look at what **attributes** Connections have and how
to define them correctly.

Connections can be defined in Excel, YAML or in the table in the MS SQL
database.

When you want to connect to data files, you must define three attributes
- ConnectionName, ConnectionType and ConnectionString.

![Atributes](Images/media/image23.png)

Here you can find a description of the attributes:


| **Attribute**    | **Description**                 | **Mandatory** |
|------------------|---------------------------------|---------------|
| ConnectionName   | You choose the ConnectionName yourself - it is the name for the query source. This is used in the definitions of the tests. The ReferenceQuerySource and TestQuerySource can contain only values defined here in ConnectionName.   | Yes           |
| ConnectionType   | You choose the ConnectionType attribute based on where your data are stored. You can select one of the following types: Excel, ExcelOleDB, SqlServer, Yaml, Oracle, Postgres, Dax Find details in the 'Various Connection Types' chapter | Yes           |
| ConnectionString | For Excel, ExcelOleDB and Yaml this contains path to the file. For SqlServer, Oracle, Dax and Posgres, this contains connection string.   | Yes           |


In Excel file and in the Table in MS SQL database, one row represents
one Connection definition. In the case of Yaml file, each Connection
definition begins with a hyphen. See examples below.

**Examples:**

You can define Connections in an Excel file, in YAML, or in a table in
MS SQL database. Below you can see some examples of what the file with
Connection Definitions might look like.

-   Connections stored in MS SQL database

![Connections stored in MS SQL database](Images/media/image24.png)

-   Connections stored in Excel

![Connections stored in Excel](Images/media/image25.png)

-   Connections stored in YAML

![Connections stored in YAML](Images/media/image26.png)

### Various connection types

JC.Unit can test various data sources. In this subchapter you will learn
what types of connections we can use for testing.

When you want to connect to data file, you must define three attributes
- ConnectionName, ConnectionType and ConnectionString.

Let\'s take look at the attribute **ConnectionType**.

The ConnectionType is selected according to the data source to which you
want to connect.

![ConnectionType](Images/media/image27.png)

Supported providers for connections:

| **ConnectionType** | **Description** | **Connection string**| **An Example** |
|----------------|----------------|----------------|----------------|
| Excel | Is used for connection to Excel file. This connection is selected only if a simple query is performed in TestQuery/ReferenceQuery e.g. SELECT * FROM MyExcelSheet, or SELECT Column1, Column2 FROM MyExcelSheet. ConnectionString is a path to the file. | [Path to the excel file] or [Relative path to the excel file] | C:\Users\TerezaCerná\Documents\JC.Unit\PersonsInfo.xlsx or ..\PersonsInfo.xlsx|
| ExcelOleDB | Is used for connection to Excel file. This connection is selected if more complex queries, aggregate functions, conditions, etc. are performed in TestQuery/ReferenceQuery. The name of the sheet we are querying must be in square brackets and must end with a dollar sign - for example: SELECT count(*) FROM [MyExcelSheet$]. ConnectionString is a path to the file.   | [Path to the excel file] or [Relative path to the excel file] | C:\Users\TerezaCerná\Documents\JC.Unit\PersonsInfo.xlsx or ..\PersonsInfo.xlsx |
| SqlServer | Is used for connection to the MS SQL database. ConnectionString is a Connection string to the MS SQL database. | Data Source=[Server Name];Integrated security=[True/False];Initial Catalog=[Database Name]; or Data Source=[Server Name];Uid=[User Name];Pwd=[Password];Initial Catalog=[Database Name]; | Data Source=demoserver<span></span>.database.windows.net;Integrated Security=True;Initial Catalog=TestDatabase; or Data Source=demoserver<span></span>.database.windows.net;Uid=User123;Pwd=Password123;Initial Catalog=TestDatabase;|
| Oracle | Is used for connection to the Oracle database. ConnectionString is a Connection string to the Oracle database. | Data Source=(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = [Host name])(PORT = [Port Number])) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = [Database Name])));User Id=[User];Password=[Password];Persist Security Info=[True/False]; | Data Source=(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = DATA1<span></span>.DEMO.COM)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = DWHDemo)));User Id=User123;Password=Password123;Persist Security Info=True;|
| Dax | Is used for connection to Tabular. ConnectionString is a Connection string to the Tabular. | Provider=MSOLAP;Data Source=[Server Name];Initial Catalog=[Database Name]; or Provider=MSOLAP;Data Source=[Server Name];Initial Catalog=[Database Name];EffectiveUserName=[Log as a specific user] | Provider=MSOLAP;Data Source=czdem007\tabular;Initial Catalog=DemoTab; or Provider=MSOLAP;Data Source=czdem007\tabular;Initial Catalog=DemoTab;EffectiveUserName = "User\XXX123" |
| Postgres | Is used for connection to the PostgreSQL database. ConnectionString is a Connection string to the PostgreSQL database. | Host=[Host Name];port=[Port Number];dbname=[Database Name];connect_timeout=10 | Host=localhost;port=5432;dbname=postgres;connect_timeout=10 |
| Pbix | Is used for connection to the Power BI Desktop datasets. Connection string is a name of the opened Power BI desktop report. Power BI report which you want to test must be opened! | [Name of the opened Power BI file] | My Demo Report |


### Where to store connections

Connections that we define can be stored in Excel file, YAML file or in
a table in SQL Server database.

Depending on where the definitions are stored, we choose the key
\"**Provider**\", which is in the \"configuration file\" **JC.Unit.json**.

Under the \"**Settings**\" key is then the path to the file where the connections are stored.

Therefore, if you have a connection defined in the table in MS SQL database, you will use SqlServerConnectionDefinitionProvider and Connection string to the database.

![JC.Unit json](Images/media/image28.png)

**Supported providers for connections:**

  |             |**Provider name**                        |**Description**|
  |------------ |---------------------------------------- |--------------------------------------------------------------------------------------------------------|
  |Excel file   |ExcelConnectionDefinitionProvider        |Used for definitons declared in Excel file.|
  |Excel file   |ExcelOleDBConnectionDefinitionProvider   |Used for definitons declared in Excel file, but requires Access database engine driver to be installed.|
  |SQL Server   |SqlServerConnectionDefinitionProvider    |Used for definitons declared in MS SQL database.|
  |Yaml file    |YamlConnectionDefinitionProvider         |Used for definitons declared in YAML file.|

**Examples:**

-   Use of a **ExcelConnectionDefinitionProvider**

![ExcelConnectionDefinitionProvider](Images/media/image29.png)
 
-   Use of a **YamlConnectionDefinitionProvider**

![YamlConnectionDefinitionProvider](Images/media/image30.png)

-   Use of a **SqlServerConnectionDefinitionProvider**

![SqlServerConnectionDefinitionProvider](Images/media/image31.png)

## Test Definitions

### How to define tests

In this subchapter we will show you how to write a test correctly. Each
test has several attributes, which will be presented here.

Each test has several Attributes that must always be defined, the others
are optional. Here is an overview of them:

| **Attribute**        | **Description**      | **Mandatory**        |
|----------------------|----------------------|----------------------|
| TestSuite            | Optional. A name which is used for grouping test cases together. | No |
| Order                | Optional. Integer value is expected. | No |
| TestCase             | Optional. A test case is a specification of the inputs, execution conditions, testing procedure etc. | No |
| TestName             | Does not need to be unique. Combination of TestSuite, Order, TestCase and TestName has to be unique | Yes |
| TestDescription      | Optional. Description of the test. | No |
| TestQuerySource      | One of the values defined in ConnectionName  | Depends on TestTypeName |
| TestQuery            | A command (e.g. SQL, DAX, …) that can by understand by the given connection type. Or expected value for some test types. | Depends on TestTypeName |
| ReferenceQuerySource | One of values defined in ConnectionName | Depends on TestTypeName |
| ReferenceQuery       | A command (e.g. SQL, DAX, …) that can by understand by the given connection type.  | Depends on TestTypeName |
| TestTypeName         | SameData, RowCount or ZeroRows. Or other type of tests implemented in future. | Yes |
| Tolerance            | You can set how much the two values can differ. | No |
| Timeout              | Timeout in seconds. | No |

In Excel file and in the Table in MS SQL database, one row represents
one test. In the case of Yaml file, each test begins with a hyphen. See
examples below.

**Examples:**

-   TestDefinitions in **MS SQL database**:

![TestDefinitions](Images/media/image32.png)

-   TestDefinition in **Excel file**:

![TestDefinitions](Images/media/image33.png)

-   TestDefinition in **YAML**:

![TestDefinitions](Images/media/image34.png)

### Where to store tests

Tests that we write can be stored in Excel file, YAML file or in a table
in MS SQL database.

Depending on where the tests are stored, we choose the key
\"**Provider**\", which is in the **JC.Unit.json** file.

In the \"**Settings**\" key is then the path to the file where the tests
are stored.

**Supported providers for tests:**

|                   | **Provider name**                       | **Description**|
| ----------------- |----------------------------------------  |--------------------------------------------------------------|
| Excel file        | ExcelConnectionDefinitionProvider        | Used for definitons declared in Excel file.|
| Excel file        | ExcelOleDBConnectionDefinitionProvider   | Used for definitons declared in Excel file, but requires Access database engine driver to be installed.|
| MS SQL database   | SqlServerConnectionDefinitionProvider    | Used for definitons declared in MS SQL database.|
| Yaml file         | YamlConnectionDefinitionProvider         | Used for definitons declared in YAML file.|

 
Which provider is used for loading our tests is defined in \"configuration file\" (JC.Unit.json) - under \"**Provider**\" key.

Don\'t forget to set also proper \"connection string\" under \"**Settings**\" key.

**Examples:**

-  Use of a **SqlServerTestDefinitionProvider**

![SqlServerTestDefinitionProvider](Images/media/image31.png)

-   Use of a **ExcelTestDefinitionProvider**

![ExcelTestDefinitionProvider](Images/media/image29.png){width="4.958333333333333in"
height="1.65625in"}

-   Use of a **YamlTestDefinitionProvider**

![YamlTestDefinitionProvider](Images/media/image30.png)

### Various Test types

One of the mandatory attributes in a test definition is the
TestTypeName attribute. This subchapter describes the three types of
tests that JC.Unit supports.

**TestTypeName must be declared for each test.**

JC.Unit supports the following types of tests:

-   SameData
-   RowCount
-   ZeroRows


#### SameData

This test compares that the results of both queries are the same - the test will iterate through both result sets.

This test requires all the fields specified (TestQuerySource, TestQuery, ReferenceQuerySource and ReferenceQuery).
It will fail if any value in the result set is different.

#### RowCount

This test compares whether a data source has a certain number of rows.
In **TestQuery**, put the SQL, DAX or whatever query that returns rows.
In **ReferenceQuery**, put the expected number of rows (just simple integer).

The test will pass, if the number of rows is equal to the expected number.

#### ZeroRows

This test is used if we expect the result of our query to be an empty table.
There must be only **TestQuerySource** and **TestQuery** to be
specified. The test will pass only if the returned result set contains
no rows.

**Example:**

![Test types](Images/media/image35.png)

## JC.Unit.Runner

Runner is a tool used to run tests and for easy debugging. It also shows
how many tests were run in total and the total time for how long the
tests were executed.

It is located in the JC.Unit.Runner folder, just open the .exe file.

![JC.Unit.Runner](Images/media/image36.png)

The runner reads the **JC.Unit.json** configuration file and looks for
tests according to the path defined there.

JC.Unit.json should therefore be placed one level above JC.Unit.Runner.

![JC.Unit.Runner](Images/media/image37.png)

After opening the JC.Unit.Runner, all you have to do is to click on
RELOAD TESTS button.

The advantage of Runner is easy orientation - tests are divided into
groups according to Test Suites. When we open Test Suites, we will see
the individual tests.

![](Images/media/image38.png)

 
When tests are loaded select which tests you want to execute (it can be
a single test), then click on the RUN TESTS button.

Failed tests are marked in red. Error details are available in the
**Results** bookmark. In the **Queries** bookmark it is possible to copy
queries for easy debugging.

![JC.Unit Runner](Images/media/image39.png)

## Tips & Tricks

### More information about YAML

This provider is most comfortable to work with.

Especially queries spanning more lines are easy editable. The file
should have .yaml extension. Install YAML extension in VS code for easy
editing.

I recommend you read this blog post to get familiar with YAML:
[[https://blog.stackpath.com/yaml/]{.ul}](https://blog.stackpath.com/yaml/)

 
**Important YAML formatting**

When writing tests in YAML, make sure you don\'t forget the **hyphen**
at the beginning of the line, or the

**inequality sign** when writing the query (this sign ensures that a
value that is contained on multiple lines is read).

![Yaml](Images/media/image40.png)

### Create ConnectionDefinition Table in the database

If you want to have a connection definitions defined in the database use
following SQL script.

At first it is necessary to create schema Test in the database. Name of
the table must be \"ConnectionDefinition\".

> CREATE TABLE \[Test\].\[ConnectionDefinition\]  
> (  
> \[ConnectionName\] \[NVARCHAR\](200) NOT NULL PRIMARY KEY CLUSTERED,  
> \[ConnectionType\] \[NVARCHAR\](200) NOT NULL,  
> \[ConnectionString\] \[NVARCHAR\](2000) NOT NULL  
> );  

###  Create TestDefinition Table in the database

If you want to have a test definitions defined in the database use
following SQL script.

At first it is necessary to create schema Test in the database. Name of
the table must be \"TestDefinition\".

> CREATE TABLE \[Test\].\[TestDefinition\]  
> (  
> \[TestSuite\] NVARCHAR(300) NULL,  
> \[Order\] INT NULL,  
> \[TestCase\] NVARCHAR(300) NULL, 
> \[TestName\] NVARCHAR(300) NOT NULL,  
> \[TestDescription\] NVARCHAR(MAX) NULL,  
> \[TestQuerySource\] NVARCHAR(200) NULL,  
> \[TestQuery\] NVARCHAR(MAX) NULL,  
> \[ReferenceQuerySource\] NVARCHAR(200) NULL,  
> \[ReferenceQuery\] NVARCHAR(MAX) NULL,  
> \[TestTypeName\] VARCHAR(50) NOT NULL,  
> \[Tolerance\] DECIMAL(19, 4) NULL,  
> \[Timeout\] INT NULL  
> );