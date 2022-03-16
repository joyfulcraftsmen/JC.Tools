# CsvOleDB Connector

This provider allows you to connect to CSV files and issue SQL statements against it's data.

To use it, you have to install a driver. See [prerequisites](../installation/prerequisites).

See this example:

![CSV connector](../../Images/media/csv-vs-excel.jpg)

In the first Connection Definition, you instruct JC.Unit to connect to Execution folder one level above working directory. 

> **Important** Please mention you do NOT specify the file name in the connection string. The path should point to the folder where your CSV file resides. 

You can also tweak whether your file has headers or not.

In the query you then specify in FROM clause the name of the CSV file. See ReferenceQuery in the above example. It instructs JC.Unit to read all columns and all rows from the Artists.csv file that is located in the folder mentioned in the ConnectionString.

This also means you can define just one connection for all CSV files in the same folder.

The example above then uses SameData test type to compare data in the CSV file with the data in the MS Excel file.

