# Test Definition Providers

[Test Definitions](./what-is-test-definition) need to be defined somewhere, e.g. in a database table or in some sort of file. Hence *Test Definition Providers*. 

They just tell the JC.Unit system WHERE to look for these test definitions - where you store information about tests you want to perform.

Example of data that make up a *Connection Definition Provider*:

| Key      | Value                  |
| -------- | ---------------------- |
| Provider | Excel                  |
| Settings | .\TestDefinitions.xlsx |

In this case, you tell to JC.Unit that you defined all your tests in a MS Excel file and that the file is in your working directory and its name is TestDefinitions.xlsx. That is enough information for JC.Unit to read all tests that you defined in that file.

You can store your test definitions in e.g., MS SQL Server table, ORACLE table, MS Excel file or YAML file.

These are supported *Test Definition Providers*:

| Provider         | Code       | Notes                                     |
| ---------------- | ---------- | ----------------------------------------  |
| [YAML](./providers/yaml)        | Yaml       | reads definitions from a local YAML file
| [SQL Server](./providers/sql-server) | SqlServer  | reads definitions from a MS SQL server table (MS Azure is supported)
| [ORACLE](./providers/oracle)     | Oracle     | reads definitions for a ORACLE database table
| [MS Excel](./providers/ms-excel)         | Excel      | requires no driver, has advanced features
| [MS Excel (OleDB)](./providers/ms-excel-oledb) | ExcelOleDB | fast, requires a driver, less features than MS Excel provider



> You can use different providers for loading connection definitions and for loading test definitions. These are intentionally separated things, because it is surprisingly often handy to have freedom in where you store connection definitions and where you store test definitions.

> All Test Definition Providers have implemented their Connection Definition Providers "counterpart". E.g., you can have both your Connection Definitions and Test Definitions stored in ORACLE database. MS Excel and YAML providers allow you even to store both Connection Definitions and Test Definitions in the very same file, which is handy for development of your data tests.

------

## Related Topics

* [What is Test Definition](./what-is-test-definition)
* [Connection Definition Providers](../connection-definitions/connection-definition-providers)
