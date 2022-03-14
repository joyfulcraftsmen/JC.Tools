# Connection Definition Providers

[Connection Definitions](./what-is-connection-definition) need to be defined somewhere, e.g. in a database table or in some sort of file. Hence *Connection Definition Providers*. 

They just tell the JC.Unit system WHERE to look for these connection definitions, where you store information about connections you will be using.

Example of data that make up a *Connection Definition Provider*:

| Key      | Value                  |
| -------- | ---------------------- |
| Provider | Excel                  |
| Settings | .\TestDefinitions.xlsx |

In this case, you tell to JC.Unit that you defined all your connections in a MS Excel file and that the file is in your working directory and its name is TestDefinitions.xlsx. That is enough information for JC.Unit to read all connections that you defined in that file.

You can store your connection definitions in e.g., MS SQL Server table, ORACLE table, MS Excel file or YAML file.

These are supported *Connection Definition Providers*:

| Provider         | Code       | Notes                                     |
| ---------------- | ---------- | ----------------------------------------  |
| [YAML](./providers/yaml)        | Yaml       | reads definitions from a local YAML file
| [SQL Server](./providers/sql-server) | SqlServer  | reads definitions from a MS SQL server table (MS Azure is supported)
| [ORACLE](./providers/oracle)     | Oracle     | reads definitions for a ORACLE database table
| [MS Excel](./providers/ms-excel)         | Excel      | requires no driver, has advanced features
| [MS Excel (OleDB)](./providers/ms-excel-oledb) | ExcelOleDB | fast, requires a driver, less features than MS Excel provider


> You can use different providers for loading connection definitions and for loading test definitions. These are intentionally separated things, because it is surprisingly often handy to have freedom in this.

> All Connection Definition Providers have implemented their Test Definition Providers "counterpart". E.g., you can have both your Connection Definitions and Test Definitions stored in ORACLE database. MS Excel and YAML providers allow you even to store both Connection Definitions and Test Definitions in the very same file, which is handy for development of your data tests.