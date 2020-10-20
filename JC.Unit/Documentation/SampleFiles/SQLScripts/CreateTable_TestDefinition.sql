CREATE TABLE [Test].[TestDefinition]
(
    [TestSuite] NVARCHAR(300) NULL,
    [Order] INT NULL,
    [TestCase] NVARCHAR(300) NULL,
    [TestName] NVARCHAR(300) NOT NULL,
    [TestDescription] NVARCHAR(MAX) NULL,
    [TestQuerySource] NVARCHAR(200) NULL,
    [TestQuery] NVARCHAR(MAX) NULL,
    [ReferenceQuerySource] NVARCHAR(200) NULL,
    [ReferenceQuery] NVARCHAR(MAX) NULL,
    [TestTypeName] VARCHAR(50) NOT NULL,
    [Tolerance] DECIMAL(19, 4) NULL,
    [Timeout] INT NULL
);
