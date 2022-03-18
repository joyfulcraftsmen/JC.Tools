# ORACLE Connector

## Prerequisites

This connector has no prerequisites, it works out-of-the-box. Just use it :-).

## Description

This connector allows you to test data in PostgreSQL database tables. You can specify any SQL statement suppoerted by [npgsql](https://www.nuget.org/packages/Npgsql/4.1.3.1) .NET NugetPackage.

## Example

![ORACLE Connector](../../Images/media/oracle-connector.jpg)

The test defined above only compares the same table issued against ORACLE express edition.


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Connection:
  - 
    ConnectionName: xe
    ConnectionType: Oracle
    ConnectionString: Data Source=(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = LOCALHOST)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = xe)));User Id=System;Password=Pa$$w0rd;Persist Security Info=True;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
