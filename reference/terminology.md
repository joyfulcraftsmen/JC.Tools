# Terminology

This is an overview of basic terms used in this documentation. It is meant just as a quick reference. You can find details in respective chapters.

<br />

## Test Definition

*Test Definition* is a collection of data, that are needed to perform a test. If you want to run a *Test*, you need to define it. A *Test Definition* is collection of such information, such as what is the name of the test, what it should do, what connections it should use, description etc.

Here is an example of information that together make up a *Test Definition*.

| Key | Value |
|-----|-------|
| TestName |  CSV file vs MS Excel |
| TestDescription | Should pass. The Excel file and CSV contain the same data. |
| TestQuerySource | MyExcel |
| TestQuery | SELECT * FROM [Sheet1$]; |
| ReferenceQuerySource | MyCsv |
| ReferenceQuery | SELECT * FROM [Artists.csv]; |
| TestTypeName | SameData |

<br />

## Test

A *Test* is a real run of a required data check based on information from *Test Definition*. A *Test* starts, connects to required data sources, performs required *Test Type* and ends. A *Test* has a *Test Result*.

<br />

## Test Result

A *Test Result* is available after a *Test* is run. It can be either Passed, Failed or Error.


| Test Result  | Meaning                                                                        |
| -------------|------------------------------------------------------------------------------- |
| Passed       | The data was successfully checked and all data comply to the constraints defined in the *Test Definition*.                                |
| Failed       | The data was successfully checked, but at least part of the data does not comply to the constraints defined in the *Test Definition*.                                |
| Error        | There was an error during the *Test* run and the data was NOT successfully checked.                                                                            |

<br />

## Test Definition Provider

*Test Definition*, as stated above, is a collection of information needed to perform a *Test*. These data have to be defined / stored somewhere. A *Test Definition Provider* tells the system WHERE your *Test Definitions* are. *Test Definitions* can be stored e.g., in a MS SQL Server table, ORACLE table, MS Excel file, YAML file, ...

Example information, that make up a *Test Definition Provider*:

| Key      | Value                                                               |
-----------|-------------------------------------------------------------------- |
| Provider | SqlServer                                                           |
| Settings | data source=localhost;integrated security=true;initial catalog=Test |

This *Test Definition Provider* tells the system that you defined your tests in a MS SQL Server database named Test and information needed to connect to that database.

<br />

## Connection

A *Test* during its run needs to connect to data sources in order to read the data and preform testing on it. A *Connection* in JC.Unit terminology is one instance of such a connection. E.g., System.Data.SqlClient.Connection object is created, opened, used, closed and disposed. This lifecycle of one such instance is called Connection in JC.Unit. For other connection types, this is analogous. 

<br />

## Connection Definition

JC.Unit is a framework focused on testing data. Therefore, it is expected that when you are defining your tests, you certainly want them to connect to data. The same way you define test, you also define these connections. Because the connection usualy repeat between tests, you provide connection definitions and test definitions separately. Test definitions refere to connection definition by a name.

Example of data, that make up a Connection Definition:

| Key              | Value         |
| ---------------- | ------------- |
| ConnectionName   | MyExcelData   |
| ConnectionType   | ExcelOleDB    |
| ConnectionString | .\MyData.xlsx |

In your test definitions, you then refer to this connection by its name - in this case 'MyExcelData'.

<br />

## Connection Definition Provider

As mentioned above, *Test Definitions* need to "come from somewhere", hence *Test Definition Providers*. Similarly, your *Connection Definitions* also have to be defined somehwere, hence *Connection Definition Providers*.

In your *Test Definitions*, you refere to *Connection Definitions* only by name. A *Connection Definition Provider* tells the JC.Unit WHERE the connection definitions are. You can e.g. store them in a MS Excel file, in MS SQL server table, in YAML file etc.

Example of data that make up a *Connection Definition Provider*:

| Key      | Value                  |
| -------- | ---------------------- |
| Provider | Excel                  |
| Settings | .\TestDefinitions.xlsx |


<br />

## Test Type

A *Test Type* is one of defined checks that need to be performed on the data. Examples:

| Test Type | Description                                                 |
| --------- | ----------------------------------------------------------- |
| SameData  | The two retrieved datasets contain same data.               |
| ZeroRows  | The retrieved dataset does not contain any data.            |
| RowCount  | The retrieved dataset contain the specified number of rows. |

