CREATE TABLE [Test].[ConnectionDefinition]
(
    [ConnectionName] [NVARCHAR](200) NOT NULL PRIMARY KEY CLUSTERED,
    [ConnectionType] [NVARCHAR](200) NOT NULL,
    [ConnectionString] [NVARCHAR](2000) NOT NULL
);